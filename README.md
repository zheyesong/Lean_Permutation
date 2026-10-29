# Lean_Permutation

[![Lean](https://github.com/zheyesong/Lean_Permutation/actions/workflows/lean.yml/badge.svg)](https://github.com/zheyesong/Lean_Permutation/actions/workflows/lean.yml)

A Lean 4 formalization of Chapters 4 (Empirical Process Theory) and 5 (Permutation Process Theory) of F. Han, *An Introduction to Permutation Processes*, version 0.5 ([arXiv:2407.09664v1](https://arxiv.org/abs/2407.09664v1)), together with Chapter 1 in full and the results from Chapters 2–3 that these chapters use. The Lean library is called `LeanPermutation`.

Most of the work is done by students, one task at a time, with two mentors who review and merge. [CONTRIBUTING.md](CONTRIBUTING.md) describes how to contribute.

**Status.** Project skeleton; the Lean formalization has not started.

## Versions

Lean, Mathlib and [Statlib](https://github.com/stat-lib/statlib) are pinned in `lean-toolchain`, `lakefile.toml` and `lake-manifest.json`; Mathlib is the commit that Statlib pins. The mentors update these files; if your work needs a change there, say so in an issue.

## Build

Install Lean with [elan](https://github.com/leanprover/elan), then:

```bash
git clone https://github.com/zheyesong/Lean_Permutation.git
cd Lean_Permutation
lake exe cache get
lake build
```

## License

Code, blueprint and documentation are released under the Apache License 2.0; see [LICENSE](LICENSE).
