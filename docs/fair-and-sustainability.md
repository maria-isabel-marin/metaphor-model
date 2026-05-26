# FAIR, reproducibility, and sustainability

This document records the FAIR and Open Science orientation of
`metaphor-model`, the sensitive-data considerations the project takes
into account, and the sustainability goals that guide how the modelling
layer is maintained.

It describes **goals and current practice**, not certifications. Where
something is aspirational, it is marked as such.

## FAIR orientation

The FAIR principles — Findable, Accessible, Interoperable, Reusable —
are taken as a working orientation rather than a checklist. Concretely:

- **Findable.** The repository documents what `metaphor-model` is and
  how it fits into MetaphorModel.org, so that researchers who land on
  it can understand its role without external context. Citation
  metadata is provided in [`CITATION.cff`](../CITATION.cff).
- **Accessible.** The repository is hosted on GitHub and the
  documentation is in plain Markdown. No special tooling is needed to
  read it.
- **Interoperable.** The conceptual vocabulary is designed so that the
  several ecosystem components can use it consistently. The intent is
  to commit to a machine-readable serialisation as the model
  consolidates; this is aspirational at present.
- **Reusable.** The model is documented at the conceptual level so
  that other research projects can adopt, adapt, or critique it.
  Licensing of derived data and code is governed by the individual
  component repositories that produce them.

## Reproducibility

The model layer supports reproducibility of the wider research by:

- making the conceptual commitments of the analysis explicit, so that
  a reader can tell *what* was modelled and *how*;
- treating annotation **provenance and review information** as part of
  the model rather than as a back-end implementation detail, so that
  every analytical claim can be traced to who produced it, when, and
  with which tool or model;
- versioning the documentation through git history, so that changes to
  the model are inspectable over time.

A formal release / tagging policy will be added once the model
stabilises.

## Sensitive data awareness

MetaphorModel.org analyses corpora that include politically sensitive
material — in particular, the report of the Colombian Truth Commission,
which documents grave human rights violations and the testimony of
survivors and witnesses.

This has consequences for the modelling layer:

- The model treats *textual source* as a first-class entity with its
  own metadata, so that the provenance and context of any analysed
  passage stays attached to the analysis. Decontextualised quotation
  is to be avoided.
- The model accommodates annotation provenance so that interpretation
  can be reviewed and contested rather than presented as authorless
  fact.
- Storage, redaction, and access control are the responsibility of the
  back-end components that hold actual corpus data; the model layer
  itself does not store sensitive material.
- Any future serialisation of the model that ships example data must
  use non-sensitive examples.

## Documentation practices

- Documentation lives next to the code (in this repository) so it
  stays inspectable and versioned.
- Conceptual decisions are written down in [`schema-overview.md`](schema-overview.md);
  architectural decisions in [`architecture.md`](architecture.md).
- Open modelling questions are recorded explicitly rather than left
  implicit, so that future contributors know where the model is firm
  and where it is still settling.

## Sustainability goals

`metaphor-model` is doctoral research software. Its sustainability
plan is modest and honest:

- Maintain a clear **separation between model, data, processing, and
  interface layers** so that any one of them can evolve without
  forcing the others to rewrite. See [`architecture.md`](architecture.md).
- Keep the documentation in plain Markdown and the citation metadata
  in CFF so that the project remains legible even if surrounding
  tooling changes.
- Avoid introducing dependencies in the model layer that would tie
  it to a specific runtime or framework.
- Treat the model as something that can be cited and referenced in
  scholarly work in its current state, while being honest about its
  prototype status.

The long-term maintenance horizon of this repository is tied to the
dissertation and to subsequent post-doctoral work. This will be
reassessed as the project matures.
