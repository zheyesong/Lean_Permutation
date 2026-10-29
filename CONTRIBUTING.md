# Contributing

This project formalizes in Lean 4 Chapters 4 (Empirical Process Theory) and 5 (Permutation Process Theory) of F. Han, *An Introduction to Permutation Processes*, version 0.5 (arXiv:2407.09664v1), together with Chapter 1 in full and the results from Chapters 2–3 that these chapters use. The Lean library is called `LeanPermutation`.

Two mentors run the project. They have the same role: either of them can assign a task, answer questions, review and merge. Contributions beyond the posted tasks are welcome too; if yours introduces or changes a definition, see "Design before code" below. Questions are welcome on the issue of your task, or in a new issue.

## Design before code

Definitions fix the vocabulary that later work builds on. When you introduce a new definition or API, or change a shared definition, it is best to discuss the design with a mentor before writing much code:

1. Open an issue, or use the issue of your task. A draft pull request that contains only the definition works as well.
2. Discuss the design there: names, namespaces, how the objects are represented, the order of arguments, typeclass assumptions, and edge cases.
3. Once the design is settled, write the rest.
4. If the design was discussed in an issue, link it in the pull request.

Small fixes, documentation and narrowly scoped lemmas need no design discussion.

## Pull requests

- Open the pull request from a branch other than `main`, on your fork or, if you have write access, on this repository.
- One pull request, one motivation. A pull request under about 500 changed lines is easy to review; up to about 2000 is fine if it stays on one motivation. Anything larger should say in its description why it is so large.
- Title: imperative, at most 70 characters, with a prefix for the kind of change and the area, for example `feat(Covering): add the volume bound` or `fix(blueprint): correct the uses of thm:han-3-2`.
- Description: why (the motivation), what changed (the scope) and how you checked it (the test plan). Link the issue, if there is one: `Closes #<number>`, or `Refs #<number>` if the pull request does not finish it.
- Before asking for review, check that `lake build` passes with no new warnings (warnings about `sorry` are fine) and that `lake lint` passes; CI runs both. On your first pull request from a fork, CI starts only after a mentor approves it.
- Once review has started, do not force-push; add commits instead. To bring in changes from `main`, you can merge `main` into your branch.
- Leave `lean-toolchain`, `lakefile.toml` and `lake-manifest.json` to the mentors; if your work needs a new dependency or version, say so in an issue.
- A mentor reviews the pull request and merges it.

## Lean code

- Every Lean file starts like this:

  ```lean
  /-
  Copyright (c) <year> <authors>. All rights reserved.
  Released under Apache 2.0 license as described in the file LICENSE.
  Authors: <authors>
  -/
  import Mathlib.Probability.UniformOn

  /-!
  # <Title of the file>

  <What the file proves, and the blueprint labels it covers.>
  -/

  namespace LeanPermutation

  end LeanPermutation
  ```

  `<year>` is the year the file is created, and `<authors>` are the people who wrote it, by name or GitHub name. Put yourself in both lines of a file you create; if you add a substantial part to an existing file, you may add yourself to its Authors line.
- Import only the modules the file uses, one per line, as Mathlib does; do not import a whole package such as `Mathlib`. New files usually go under `LeanPermutation/`, with Mathlib-style names such as `Covering.lean`; add each one to `LeanPermutation.lean` as an `import` line.
- Declarations live in the namespace `LeanPermutation`. Follow Mathlib's naming and style conventions; every definition and every main theorem has a docstring.
- Reuse existing Mathlib declarations instead of reproving them. A helper lemma used only in its own file can be `private`; the blueprint cannot refer to a private name.
- A pull request that fills in a `sorry` adds no new `sorry` elsewhere. If your pull request leaves a `sorry`, say so in the description.
- Do not copy the book. Write statements, docstrings and comments in your own words, and cite the book by item and page. Never commit the book's PDF.
- Describe differences from the book neutrally: say how and why the code differs, for example which hypothesis was added and where the proof needs it.

## Blueprint

The plan of the formalization is the blueprint in `blueprint/src`, written with [leanblueprint](https://github.com/PatrickMassot/leanblueprint). Its first chapter fixes conventions for the whole project: covering numbers, sub-Gaussian variables, weak convergence and finite populations, among others.

- Follow the blueprint rather than the book. Some printed statements need a change before they can be formalized; the blueprint records the version to formalize, the item and page of the book, and a tag: `as printed`, `adapted`, `new` or `Mathlib`. `as printed` refers to the mathematics: the statement is the book's, up to notation, but the words are our own.
- Do not weaken or change a hypothesis to make a proof go through. If a statement seems to need a change, say so in the issue of your task, or in a new issue, before changing it. Nodes marked "not ready" (orange in the dependency graph) are not formalized until their statement is settled.
- When you formalize a node, add `\lean{...}` with your declaration names to it, and `\leanok`: inside the statement environment once the statement is formalized, and inside the proof environment once the proof is complete. Make `\uses{...}` match what the statement and the proof actually use. Adding `\lean{...}` or `\leanok` to a node does not change its statement.
- Some nodes name Mathlib declarations in their text ("In Mathlib: ..."). When a file of yours uses one of them, add it to the node's `\lean{...}` in the same pull request.
- Every name in `\lean{...}` must exist in the library, as `LeanPermutation.lean` imports it; a Mathlib name counts once a file of the library imports its module. CI builds the blueprint and checks the names on every pull request. To build it yourself, see "Build the blueprint" in the [README](README.md).

## AI assistance

AI tools are welcome. If you used one, say so in the pull-request description. One line is enough, such as `Made with <tool>` or a `Co-Authored-By:` line. You must understand, and be able to explain, every line you submit: "the AI wrote it" does not answer a review question. As a rough guide, keep at most three AI-assisted pull requests open at a time.

## License

- The repository is released under the Apache License 2.0 (`LICENSE`): the code, the blueprint and the documentation.
- Contributions are licensed under the same license. By opening a pull request, you agree that your contribution is released under it.
- The license covers what the contributors write. The book is not covered: do not copy it (see "Lean code").
