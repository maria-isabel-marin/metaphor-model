# Schema overview

This document describes the conceptual entities and relationships that make
up the `metaphor-model`. It is **conceptual documentation** — it describes
what the model is about, not a code-level specification. Concrete
serialisations, type definitions, or API contracts may be added in later
revisions of the repository.

## Scope

The model covers the entities needed to:

1. record metaphorical material observed in textual sources;
2. relate that material to underlying conceptual structures (metaphors,
   scenarios, regimes, narratives);
3. keep track of who interpreted what, when, and how (annotation and
   provenance);
4. allow several MetaphorModel.org components to share a common
   understanding of these entities.

The model is informed by Conceptual Metaphor Theory and by Metaphor
Field-Loop Theory (MELT). It does not claim to be a universal
formalisation of metaphor; it is a working model for a specific research
programme.

## Entities

### Textual source

A textual unit that can be analysed for metaphorical content. In practice
this can be:

- a whole document (e.g. a chapter of a report),
- a smaller passage with its position in the larger document,
- or any other corpus item that the research design treats as a unit of
  analysis.

A textual source carries enough metadata to locate it in its original
corpus (identifier, position, language, and any corpus-level descriptors
needed for analysis).

### Metaphorical expression

A concrete linguistic occurrence in a textual source identified as
metaphorical. It refers back to the textual source and records the
specific span (or spans) that make it up.

A single textual source may contain many metaphorical expressions; a
single metaphorical expression belongs to exactly one textual source.

### Focus

The lexical material within a metaphorical expression that carries the
metaphorical meaning — the word or words that "do the metaphorical work."
The focus is what motivates the assignment of the expression to a
conceptual metaphor.

### Conceptual metaphor

The underlying cross-domain mapping that motivates one or more
metaphorical expressions. A conceptual metaphor is typically written as
TARGET DOMAIN IS SOURCE DOMAIN (for example, ARGUMENT IS WAR).

A conceptual metaphor groups metaphorical expressions that share the same
mapping, regardless of the specific words used.

### Source domain

The conceptual domain from which the mapping draws (for example, *war*,
*journey*, *building*). A source domain is reused across many conceptual
metaphors.

### Target domain

The conceptual domain that the mapping structures (for example,
*argument*, *life*, *theory*). A target domain is also reused across
conceptual metaphors.

### Ontological correspondence

A mapping between entities of the source and target domains (for example,
*the opponents* ↔ *the participants in the argument*). Ontological
correspondences capture **what corresponds to what** under the mapping.

### Epistemic correspondence

A mapping between knowledge or inferences associated with the source and
target domains (for example, *"in war one can be defeated"* ↔ *"in an
argument one can lose"*). Epistemic correspondences capture **what can be
inferred** because of the mapping.

### Metaphor scenario

A structured situation type built from one or more conceptual metaphors.
A scenario specifies the typical roles, the script that unfolds, and the
inferences that the scenario licenses. Scenarios are the level at which
metaphors most directly do narrative work.

### Metaphor regime

A higher-level configuration of scenarios that characterises how a
discourse community talks about a given topic across many texts. Where a
single scenario lives in a single passage, a regime is a pattern that
recurs and structures a discursive field.

### Cultural narrative

A narrative pattern in which metaphor regimes and scenarios participate,
connecting metaphor to broader cultural and political meaning-making.
Cultural narratives are the level at which the analysis connects to
research questions about social mobilization, collective memory, and
ideology.

### Annotation

An interpretive act that links a textual source (or a span within it) to
one or more of the entities above. Annotations may be produced by:

- a human annotator,
- an AI or NLP component (for example via `ai-melt`),
- or a combination, such as an AI proposal that a human reviews.

An annotation records what was annotated, by whom (or by which
component), with what role (proposal, review, confirmation), and any
notes the annotator wanted to attach.

### Provenance / review information

Metadata describing the lifecycle of an annotation: who produced it, when,
with which tool or model version, what its current review status is, and
who reviewed it. Provenance is what makes the analytical chain
inspectable and what allows the research to be reproducible.

## Relationships at a glance

- A **textual source** contains zero or more **metaphorical expressions**.
- A **metaphorical expression** has one **focus** and is interpreted as
  realising one or more **conceptual metaphors**.
- A **conceptual metaphor** links exactly one **source domain** to
  exactly one **target domain**, and is elaborated by **ontological**
  and **epistemic correspondences**.
- A **metaphor scenario** draws on one or more **conceptual metaphors**.
- A **metaphor regime** organises related **scenarios** across a corpus.
- A **cultural narrative** is realised in part through **regimes** and
  **scenarios**.
- Every analytical claim above is recorded as one or more **annotations**,
  each carrying **provenance / review information**.

## Open modelling questions

These are recorded here so that future revisions of the repository can
address them explicitly rather than implicitly:

- The exact serialisation format(s) the ecosystem will commit to.
- How versioning of the model is communicated to downstream components.
- How alignment with external vocabularies (e.g. linguistic annotation
  standards) is handled, where relevant.

These questions are open precisely because the project is research
software in active development; see the project status note in the
[`README.md`](../README.md).
