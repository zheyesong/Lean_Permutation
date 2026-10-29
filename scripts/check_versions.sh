#!/usr/bin/env bash
# Check that the pinned versions are consistent:
#   * Mathlib in our manifest is the commit that Statlib's manifest pins;
#   * our lean-toolchain equals Statlib's and Mathlib's.
# Run after Lake has fetched the dependencies (for example after `lake build`).
set -euo pipefail
# python3 on Linux and macOS; python or py -3 on Windows (Git Bash).
PY=""
for candidate in python3 python "py -3"; do
  # Try to run it: on Windows a "python3" on PATH can be the Microsoft Store placeholder.
  if $candidate -c 1 >/dev/null 2>&1; then PY="$candidate"; break; fi
done
if [ -z "$PY" ]; then echo "no working Python interpreter found" >&2; exit 1; fi
$PY - <<'PY'
import json, pathlib, sys

root = pathlib.Path(".")
ours = json.loads((root / "lake-manifest.json").read_text())
pkgs_dir = root / ours.get("packagesDir", ".lake/packages")

def find(manifest, needle):
    for p in manifest["packages"]:
        if needle in p.get("url", ""):
            return p
    sys.exit(f"no package with url containing {needle!r}")

statlib = find(ours, "stat-lib/statlib")
mathlib = find(ours, "leanprover-community/mathlib4")
statlib_dir = pkgs_dir / statlib["name"]
theirs = json.loads((statlib_dir / "lake-manifest.json").read_text())
pinned = find(theirs, "leanprover-community/mathlib4")["rev"]

toolchain = (root / "lean-toolchain").read_text().strip()
errors = []
if mathlib["rev"] != pinned:
    errors.append(f"Mathlib {mathlib['rev']} differs from Statlib's pin {pinned}")
for name, path in [("Statlib", statlib_dir / "lean-toolchain"),
                   ("Mathlib", pkgs_dir / mathlib["name"] / "lean-toolchain")]:
    theirs_tc = path.read_text().strip()
    if theirs_tc != toolchain:
        errors.append(f"lean-toolchain {toolchain} differs from {name}'s {theirs_tc}")
print(f"Statlib {statlib['rev']}, Mathlib {mathlib['rev']}, toolchain {toolchain}")
if errors:
    sys.exit("\n".join(errors))
print("Pinned versions are consistent.")
PY
