# Architecture notes

This document explains how `metaphor-model` relates to the other
components of the MetaphorModel.org ecosystem, and how it differs from
the external research resources that are referenced in parallel.

It is intended as a conceptual map, not a deployment description. No
runtime, packaging, or infrastructure choices should be inferred from
this document beyond what the individual component repositories actually
implement.

## Layers

The ecosystem can be read as four layers:

1. **Model layer** — `metaphor-model` (this repository). Defines the
   entities, relationships, and vocabulary that the other components
   rely on.
2. **Data layer** — the corpora and annotations produced and stored by
   the back-end components (`metaphor-manager-back`, `melt-back`,
   `metacorpus-explorer-back`). The data layer is *governed by* the
   model layer.
3. **Processing layer** — `ai-melt`. NLP and AI processing that
   produces, transforms, or enriches data, again following the model.
4. **Interface layer** — the front-ends (`metaphor-manager-front`,
   `melt-front`, `metacorpus-explorer-front`). User-facing tools that
   present and edit material that conforms to the model.

This separation is deliberate. Keeping the model layer out of any
specific application makes it possible to reason about the conceptual
commitments of the project independently of any UI or storage choice.

## Components

### metaphor-model (this repository)

The shared conceptual and data model. It is the reference for what the
ecosystem means by "metaphorical expression", "conceptual metaphor",
"scenario", "regime", "cultural narrative", and so on.

### metaphor-manager-front / metaphor-manager-back

The Metaphor Manager is the human-facing tool for registering and
organising metaphorical material. The front-end provides the
researcher-facing interface; the back-end persists annotations and
serves them. Both sides need to agree with `metaphor-model` on what an
annotation is and what it can refer to.

### melt-front / melt-back / ai-melt

MELT processing computes metaphor detection and analysis according to
Metaphor Field-Loop Theory. `melt-front` is the user-facing component,
`melt-back` orchestrates processing, and `ai-melt` provides the NLP/AI
side. The outputs of MELT processing are described in the same terms as
the rest of the ecosystem — that is what `metaphor-model` is for.

### metacorpus-explorer-front / metacorpus-explorer-back

The Metacorpus Explorer allows users to navigate the research corpora
used by the project (currently including the report of the Colombian
Truth Commission as a test case). The explorer needs to share the
ecosystem's notion of *textual source* in order to link corpus items
to metaphorical and narrative analysis.

## What is *not* part of MetaphorModel.org

The following resources are referenced by the project, are sometimes
used in parallel, or are products of related research efforts, but they
are **not internal components** of MetaphorModel.org and they are not
governed by `metaphor-model`:

- `research-lab` — a collaborative research space.
- `acd-vbg` — a related research resource.
- `MetaforasConceptuales` — a related research resource on conceptual
  metaphors.

They should be treated as external context. Any influence in either
direction is intellectual and bibliographic, not technical.

## Integration mechanism

How exactly other components consume `metaphor-model` is intentionally
left open at this stage. The repository currently functions as the
conceptual reference for the ecosystem. As the modelling work
consolidates, this section will be updated to describe the concrete
integration mechanism that the project commits to (for example, a
machine-readable schema, generated types, or a shared package).

Until that decision is made and visible in this repository, downstream
components should treat the model as documentation-level guidance and
should not assume that a packaged artefact exists.

## Boundary discipline

A few rules of thumb to keep the layering meaningful:

- The model layer must not import application code.
- Application components may *refer to* the model and must not
  silently extend it without updating the model layer.
- Provenance and review information are first-class parts of the
  model, not a back-end implementation detail.
- External research resources are cited and credited, not embedded.

These are aspirations, written down so that future contributors can
hold the project accountable to them.
