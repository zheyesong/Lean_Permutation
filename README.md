# Lean_Permutation

[![Lean](https://github.com/zheyesong/Lean_Permutation/actions/workflows/lean.yml/badge.svg)](https://github.com/zheyesong/Lean_Permutation/actions/workflows/lean.yml)
[![Blueprint](https://github.com/zheyesong/Lean_Permutation/actions/workflows/blueprint.yml/badge.svg)](https://github.com/zheyesong/Lean_Permutation/actions/workflows/blueprint.yml)

A Lean 4 formalization of Chapters 4 (Empirical Process Theory) and 5 (Permutation Process Theory) of F. Han, *An Introduction to Permutation Processes*, version 0.5 ([arXiv:2407.09664v1](https://arxiv.org/abs/2407.09664v1)), together with Chapter 1 in full and the results from Chapters 2–3 that these chapters use. The Lean library is called `LeanPermutation`.

Most of the work is done by students, one task at a time, with two mentors who review and merge. [CONTRIBUTING.md](CONTRIBUTING.md) describes how to contribute.

**Status.** The blueprint sets out the statements and the plan of the proofs; the Lean formalization has not started.

## Blueprint

The plan of the formalization is a [blueprint](https://github.com/PatrickMassot/leanblueprint) in `blueprint/src`, written in LaTeX. It states every result to be formalized, with the item and page of the book it comes from, and shows how the results depend on each other.

- [Web version](https://zheyesong.github.io/Lean_Permutation/blueprint/), with the [dependency graph](https://zheyesong.github.io/Lean_Permutation/blueprint/dep_graph_document.html)
- [PDF](https://zheyesong.github.io/Lean_Permutation/blueprint.pdf)
- [API documentation](https://zheyesong.github.io/Lean_Permutation/docs/) of the Lean library

They are rebuilt from `main` after every merge.

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

## Build the blueprint

You need Python 3, [graphviz](https://graphviz.org/) (with its development files), a TeX distribution with `xelatex` and `latexmk`, and [leanblueprint](https://github.com/PatrickMassot/leanblueprint):

```bash
pip install leanblueprint
```

Then, from the repository root:

```bash
leanblueprint pdf
leanblueprint web
leanblueprint serve
```

`leanblueprint pdf` writes `blueprint/print/print.pdf`, `leanblueprint web` writes the web version to `blueprint/web/`, and `leanblueprint serve` shows it at a local address. After `lake build` and `leanblueprint web`, `leanblueprint checkdecls` checks that every Lean name in the blueprint exists in the library.

## License

Code, blueprint and documentation are released under the Apache License 2.0; see [LICENSE](LICENSE).
