# Humanity Vault — Canon Philosophy v1

**Scope:** Conceptual only. No implementation, no architecture, no
roadmap, no new features. This document consolidates four prior
philosophy papers — *Human Capability Reconstruction Framework*,
*Verified Knowledge Representation Framework* (v1 and v2), and *The
Two Warrants of Representation* — into one canon, after a final
adversarial pass against the combined system. It is grounded against
the project's actual founding documents
([`Project_Charter_v1.md`](Project_Charter_v1.md),
[`README.md`](../README.md)), not against memory of them.

**Standing, required to be stated plainly before anything else in
this document:**

- [`Project_Charter_v1.md`](Project_Charter_v1.md) remains the
  operative founding authority of Humanity Vault. Its mission text,
  core principles, and priority order are not modified, superseded,
  or reinterpreted away by anything below.
- This Canon is **subordinate to the Charter**. Where a conflict is
  found between this document and the Charter, the Charter governs
  and this Canon must be revised — never the reverse. This is stated
  once here and repeated as Canonical Law 10.
- "Human Capability Reconstruction" (Section 1) is a **mission-layer
  interpretation of *why* the Charter's preservation mission
  matters**. It is not a replacement for the Charter's actual stated
  mission ("preserve humanity's practical, scientific, cultural,
  historical, ethical, and spiritual knowledge... offline-first...
  accessible when internet infrastructure is unavailable") and does
  not authorize any change to it.

A note on method, carried forward from every paper in this series:
nothing here is preserved because it is already canonical. It is
preserved because it survived being attacked again.

---

## Final Adversarial Pass Against the Combined System

**A. Is Capability Reconstruction genuinely the mission, or an
aspirational overlay?**
The founding Charter's actual mission text says nothing about
capability: "Preserve humanity's practical, scientific, cultural,
historical, ethical, and spiritual knowledge... offline-first...
accessible when internet infrastructure is unavailable." Its Priority
Order ranks Knowledge Preservation first and AI Assistance fifth,
with "No AI Chat" stated explicitly for the MVP. If Capability
Reconstruction contradicts this, it does not belong in the canon no
matter how well-argued.

It does not contradict it, but it is not entitled to replace it
either, and this canon fixes its status precisely: Capability
Reconstruction is a **mission-layer interpretation** of *why* the
Charter's actual, operative goal matters — not a revision of the
goal itself. This document has no authority to alter
`docs/Project_Charter_v1.md`, and does not attempt to. Every
downstream conclusion in this canon is subordinate to the literal
Charter text; where the two could be read as pulling in different
directions, the Charter's actual words govern, and Capability
Reconstruction survives only as long as it remains a faithful
explanation of that text rather than a quiet substitute for it.

**B. Is Representation a necessary layer, or collapsible into
Knowledge or Understanding?**
Test by removing it. Collapsed into Knowledge: Knowledge's defining
property is warrant (is this claim supported by a source), which is
completely independent of form — two representations of the same
warranted claim can have identical warrant and wildly different
comprehensibility. Losing Representation loses the vocabulary to say
"the claim is warranted but the artifact is badly made." Collapsed
into Understanding: Understanding is a property of a *reader's*
internal state, not of an artifact — collapsing here makes it
impossible to distinguish "the diagram was wrong" from "the reader
misread a correct diagram," which are different failures needing
different fixes. Representation survives as necessary because it is
the only layer that can be diagnosed independently of both its
source's truth and its reader's comprehension.

**C. Are Understanding and Skill genuinely distinct, or one variable
at different intensities?**
Tested by counterexample in both directions. Understanding without
Skill: a person can correctly explain why a tourniquet works and
still fail to apply one under time pressure on a real limb — no
amount of correct explanation substitutes for the missing practiced
motion. Skill without full Understanding: a person can be drilled to
execute a procedure correctly through repetition without grasping the
causal reason it works — rote competence exists. Since each can occur
without the other, they are not one continuum. Distinct.

**D and J (merged — physical readiness in the gate, and domains
requiring physical conditioning as part of learning itself).**
The chain as previously drawn treated Physical Readiness as a
terminal gate, checked only at the moment Capability is expressed.
This is correct for some domains (a splint requires no strength to
apply) and wrong for others: climbing technique cannot be practiced
at all below some minimum strength; that practice, if it can occur,
itself builds the strength that permits more demanding practice. This
is a real bootstrapping loop the terminal-gate model cannot represent
for these domains, and the attack succeeds against the earlier,
simpler version.

It does not require a new layer. It requires recognizing that the
Practice–Feedback loop, already established as cyclical, has a second
input for physically-loaded domains: current Physical Readiness gates
what Practice can be attempted, and successful Practice adapts
Physical Readiness upward, feeding back into what the next round of
Practice can attempt. Physical Readiness therefore plays two roles
depending on the domain: a pure terminal gate for domains it doesn't
constrain (most knowledge work), and an evolving co-input to the
Practice loop for domains it does (physically-loaded skills) — with
the terminal gate check still applying at the final moment of
Capability expression either way. One loop, one gate, an additional
documented edge between them. No new layer.

**E. Does the model overstate what's achievable without teachers,
institutions, or communities?**
This is fair, and the honest answer is not a defense but a limit that
must be stated plainly rather than left implicit. The chain itself
already predicts its own ceiling: Feedback on physical execution,
Experience, and the moment of Capability expression were already
listed as things no document can supply (Capability Reconstruction
paper, Section 2). For domains requiring extensive Practice–Feedback
cycling with real physical or social stakes — field surgery, complex
machine repair under failure, coordinating a group under crisis — the
honest expectation was never full reconstruction of trained
competence from reading alone. It is a substantially better starting
point and a shortened relearning curve, not parity with institutional
training. This was always implied by the model's own limitations
sections; this canon promotes it from implication to an explicit,
binding law (Canonical Law 8), because a project whose content is
often safety-critical cannot afford to let this stay merely implied.

**F. Does the Two Warrants distinction survive contact with genuinely
probabilistic generative AI, where identical inputs can yield
different outputs?**
This does not break the distinction — it is exactly the condition the
distinction was built for. Process-warrant never claimed any
individual output was guaranteed; it claimed a measured, bounded rate
of fidelity over sampled, checked outputs. Sampling variance is not a
counterexample to that claim, it is the reason the claim was phrased
as a rate rather than a guarantee in the first place. What the attack
does correctly force is a hardening of one condition: checking cannot
be a one-time certification at launch. It must be continuous and
statistically live, because a process that was reliable on the sample
checked yesterday is not thereby certified reliable on the output
generated today. Revocability (already required) must be understood
as an ongoing, monitored condition, not a one-time gate.

**G. Would "Unverified" for every runtime output be simpler and
safer than the two-status distinction?**
Already tested and rejected in the Representation Framework v2
(Attack 3): flattening misleads in both directions — it understates
outputs derived from a disciplined, checked process, and by being
obviously too harsh for that case, invites the label to be quietly
abandoned rather than kept. This canon reaffirms that verdict without
rearguing it.

**H. Is "bounded to verified knowledge" actually achievable for a
model that contains pretrained knowledge outside the corpus?**
No — not as originally phrased, and this canon corrects the phrasing
rather than pretending the problem doesn't exist. A pretrained model
cannot be guaranteed to contain zero information outside Humanity
Vault's corpus, and demanding that as a precondition is not
achievable and was never actually necessary. The precise boundary is
narrower and sharper: distinguish a capability being used as an
**instrument** from a capability being used as **factual authority**.
Linguistic capability (grammar, phrasing), structural capability
(organizing an explanation), inference-application (applying a valid
logical operation to given premises), and generic rendering
capability (depicting an everyday object like "a tank" or "a table")
may all participate freely in producing a representation, regardless
of where those capacities came from, because none of them, used this
way, assert a fact about the world — they express or manipulate facts
already given to them. A capability crosses into illegitimate
territory the instant a *specific factual detail* in its output — a
number, a procedure step, a causal claim, a domain-specific technical
fact — does not trace to the verified corpus and is presented, or
reasonably read, as though it does. "Bounded to verified knowledge"
is hereby replaced, precisely, by: **general cognitive and
representational capability may serve as an instrument; no
domain-specific factual content may originate anywhere but the
verified corpus.** This is a correction to the earlier papers'
phrasing, made explicit rather than silently substituted.

**I. Do dynamically generated images carry epistemic risks that
generated text does not?**
Yes, structurally, for four separate reasons, not one. Text has
native negation ("do not," "unless"); images do not — prohibition
must be added by convention (a slash, a caption), and whether that
convention was applied and will be read correctly by this reader is
an extra risk unique to the visual case (this is precisely the
heating-pad failure mode from the Representation Framework v2).
Text is naturally chunked into individually checkable units
(sentences); an image asserts many things at once, holistically, with
no natural unit boundary a reviewer can check one piece at a time.
Text can state a claim at a chosen level of generality ("a rigid
object such as a stick or board"); an image cannot depict "a rigid
object in general" — it must depict one specific object, risking the
reader over- or under-generalizing from that one instance. And
photorealistic rendering risks being read as photographic ground
truth — an implicit truth-claim about real appearance — in a way a
sentence, which is never mistaken for a photograph, does not risk.
These are not reasons to treat images under a different framework.
They are reasons the same framework's bar — the four conditions for
process-warrant — must be set measurably higher for image generation
than for text generation, because the failure modes are structurally
harder to catch.

**K. Does the framework hold across a large generational or cultural
gap, where a future reader shares few concepts with the author?**
Resolved, not left open, and folded into Section 15 below: the
existing Representation layer already required content be "explained
with sufficient clarity and context," but that phrase was doing more
work than its brevity acknowledged. This canon makes explicit what
was previously implicit: Representation has a third required
property, **Groundedness**, alongside the already-established
Fidelity and Transferability — the requirement that an unfamiliar
concept be connected, directly or through a chain of intermediate
analogies, to primitives the specific reader already possesses. Where
that gap is small, grounding is nearly free and invisible. Where it is
large, grounding becomes the majority of the representational work.
This is the same layer working harder, not a new layer.

**L. Has the framework accumulated unnecessary concepts?**
Audited directly. One near-miss is worth recording rather than
silently keeping: whether Experience is truly distinct from Practice,
or just "a lot of practice." It survives as distinct because Practice
— even unsupervised — remains chosen and comparatively controlled,
while Experience specifically names real, unstaged, consequential
encounters, and this distinction is exactly why the framework insists
digital media can approximate Practice but never substitute for
Experience. Everything else audited (Transformation-as-layer,
Systems-Understanding-as-layer, Physical-Readiness-as-separate-layer,
"trust the AI" framing) was already rejected in prior passes or above,
and is recorded in Section 19.

**Systems knowledge (the aquaponics stress-test).** Does a coupled
system, where no component is meaningful without the others, need a
new canonical layer? No. A Mental Model of a linear procedure is a
simple chain; a Mental Model of a coupled system is a graph with
feedback edges instead of a simple chain — a harder instance of the
same concept, not a different concept. What this does demand,
concretely, is a sharpened requirement already implicit in
Representation's fidelity discipline: because prose is delivered
serially, a Conveyance representation of a cyclical system risks
silently flattening its loop into a line unless it deliberately marks
the return edge (fish depend on the plants that depend on the water
the fish produced) — a specific, nameable fidelity failure for this
class of content, not a gap the framework lacks vocabulary for. It
belongs inside Representation (fidelity against flattening) and
Understanding/Mental Model (capturing mutual dependency, not just
sequence). No new layer.

---

## 1. Purpose of Humanity Vault

Per the Charter (`docs/Project_Charter_v1.md`): to preserve humanity's
practical, scientific, cultural, historical, ethical, and spiritual
knowledge in an offline-first, open-source platform, accessible when
internet infrastructure is unavailable. This is the operative mission
and is not modified by this canon.

The philosophical *why* beneath that operative mission, surviving
three papers of adversarial testing: knowledge is preserved because it
is the one component of human capability that can be captured
completely, transferred to a stranger with no teacher present, and
stored without decay — and the worst case the project is built for is
a single reader, alone, with no living expert left to learn from,
reconstructing competence from fragments alone. This is Human
Capability Reconstruction, held strictly as an interpretation of the
Charter's *why*, never as a replacement of its *what*.

## 2. Definition of Knowledge

A claim about the world, holding whatever warrant it has earned. In
this project, knowledge exists on a spectrum from asserted (written,
not yet checked) to Verified (checked directly against a source). The
project's operative priority order — Preservation, then Distribution,
then Verification, then Search, then AI Assistance — establishes that
Verification is foundational infrastructure, not an optional
enhancement layered on afterward.

## 3. Definition of Verified Knowledge

A claim that was checked directly against a source someone actually
read — never a search-result summary, never an assumption of
plausibility, never inherited automatically from a related claim.
"Verified Source" is this project's most carefully guarded status and
attaches only where a check actually occurred.

## 4. Representation

Verified Knowledge is never encountered directly. It is always
encountered through a Representation — a deliberate re-encoding into
a specific perceptual or interactive form (text, diagram, image,
animation, quiz, scenario, dialogue), chosen for a transfer or
reinforcement purpose. Representation is a canonical layer because it
is diagnosable independently of both the claim's truth and the
reader's comprehension (Attack B).

Representation has at least two functional roles: **Conveyance**
(forms whose job is to transmit a claim) and **Exercise** (forms whose
job is to test or reinforce a claim already transmitted, often by
deliberately withholding part of it). These require different
fidelity checks: a Conveyance representation fails if it asserts more
or less than its source; an Exercise representation fails if it treats
an unsupported answer as correct.

## 5. Representation Quality: Fidelity, Transferability, Groundedness

Three independent concerns, not one dial:

- **Fidelity** — does the representation assert only what the source
  supports, no more and no less. A property of the artifact against
  its source.
- **Transferability** — how easily this form's meaning is extracted
  by a given mind. A property of the relationship between the form and
  the reader's general cognitive apparatus.
- **Groundedness** (formalized in this canon, per Attack K) — whether
  the concept is connected, directly or through intermediate
  analogies, to primitives this specific reader already possesses. A
  property of the relationship between the form and this reader's
  *particular* prior exposure, distinct from Transferability's more
  general claim about ease of extraction.

A representation can score well on any one of these and poorly on
another: perfectly faithful and untransferable (dense, jargon-heavy,
technically accurate prose); highly transferable and unfaithful (a
clear diagram that overstates its source); well-grounded in one
reader's vocabulary and meaningless to a reader from elsewhere. None
of the three may be assumed from the other two.

## 6. Artifact-Warrant and Process-Warrant

Fidelity is not guaranteed by the act of re-encoding; it must be
obtained through one of two modes.

**Artifact-Warrant**: the representation exists as a stable artifact
before any learner encounters it, and its fidelity was checked
directly against the verified knowledge. The warrant belongs to the
checked artifact.

**Process-Warrant**: the representation is generated at the moment of
use and cannot be individually checked before encounter. Warrant — a
strictly weaker entitlement — is inherited from the process's
demonstrated, bounded, constrained, and *continuously monitored*
reliability (Attack F), never presumed from design intention.
Process-warrant is derivative: it is earned only by retrospective
artifact-checking of captured samples, and it is permanently
revocable.

Four jointly necessary conditions for a process to carry warrant at
all: **Boundedness** (inputs restricted to source-verified material —
precisely defined per Attack H as the Instrument/Authority
distinction, Section 13); **Constraint** (a categorical non-invention
rule); **Demonstrated reliability** (a known, checked pass rate on
captured samples, monitored continuously); **Revocability** (the
warrant is withdrawn the moment checking fails, and stays withdrawn
until re-earned).

## 7. Checked vs. Generated Representation

Three ordered epistemic statuses, never conflated: **Source-Verified**
(a property of a claim), **Checked Representation** (a property of a
representation whose specific form was checked — the only status that
may ever be called Verified), **Generated Representation** (a
property of a runtime representation deriving from verified claims via
a licensed process, whose specific form was never individually
checked). Composite representations mixing checked and generated
components inherit the weaker status present, by the same weakest-link
rule this project already applies to verification levels within an
article.

A Generated Representation, once captured and checked, becomes a
Checked Representation from that point forward — this is the actual
mechanism by which a process earns and keeps its license — but this
promotion is never retroactive for the reader who encountered it at
generation time.

## 8. Understanding and Mental Models

Understanding and Mental Model are one co-formed thing described from
two angles: Understanding is the subjective sense of having grasped
something; Mental Model is the structural representation that
understanding is made of. They do not arise sequentially — a reader
understands *because* a model has formed, not before and separately
from it. Distinct from Skill (Attack C): a correct Mental Model does
not guarantee the capacity to execute; a well-drilled execution does
not guarantee a correct causal model behind it.

## 9. Practice and Feedback

Not a pipeline stage but a loop: Practice produces Feedback, Feedback
revises the Mental Model, the revised model shapes the next round of
Practice. Guided Practice (with structured feedback) typically
precedes Autonomous Practice (self-directed, unstructured). Digital
representations can meaningfully accelerate the cognitive/decision
portion of this loop (scenario rehearsal, decision-point quizzing);
they cannot supply the physical-motor portion, which requires a real
body performing real repetitions.

## 10. Skill

The consolidation of repeated Practice–Feedback cycling into
repeatable, embodied, increasingly automatic execution. Cannot be
digitized directly — only its feeding stages (Understanding, guided
cognitive Practice) can be accelerated. The final consolidation into
unconscious competence requires real repetition in the real world.

## 11. Physical Readiness and Physical Adaptation

Two distinct roles, resolved in Attacks D/J. For most knowledge
domains, Physical Readiness functions purely as a terminal gate,
checked only at the moment Capability is expressed. For
physically-loaded domains (climbing, load-carrying, sustained manual
labor, endurance work), it additionally functions as an evolving
co-input inside the Practice–Feedback loop: current readiness gates
what can be practiced; successful practice adapts readiness upward;
adapted readiness permits more demanding practice. Knowledge *for*
building physical readiness (training principles, nutrition, recovery,
injury prevention) is fully preservable, ordinary knowledge, with
injury-prevention content specifically warranting the same evidentiary
rigor as safety-critical medical content, since it can prevent a
single acute bad outcome from a single read. **Physical readiness
itself — the actual capacity — can never be preserved, only its
instructional path can be.**

## 12. Capability

The real-time integration of Skill and Experience with a specific
context, gated by Mindset, Context, and Physical Readiness at the
moment expression is required. Not digitizable by definition — it is
the event itself, in a specific body, under specific real constraints,
which no archive is present for. Differentiated from adjacent terms
(Preservation, Transfer, Reconstruction, Acceleration, Recovery, per
the Capability Reconstruction paper, Section 8): Humanity Vault's
primary function is Capability *Reconstruction* (rebuilding a lost
capability from indirect artifacts, no living teacher present), with
Capability *Acceleration* as a secondary function where teachers or
institutions do still exist.

## 13. The Role and Limits of AI

AI does not create canonical knowledge authority — this is
categorical and unrevised by anything in this synthesis. AI performs
transformations, producing Representations, almost always under
Process-Warrant, since its outputs are generated at the moment of use
and cannot be individually pre-checked. It can therefore never hold
Artifact-Warrant for live output; it can only ever hold a license,
earned by continuous, monitored sampling, never presumed from its
design.

The precise governing boundary (Attack H, replacing the earlier and
less precise "bounded to verified knowledge"): **general cognitive and
representational capability — language, structuring, valid
inference-application over given premises, generic rendering — may
serve as an instrument in producing a representation, regardless of
its origin; no domain-specific factual content in that representation
may originate anywhere except the verified corpus.** A capability is
an instrument when it expresses or manipulates given facts; it becomes
illegitimate the instant its output supplies a specific fact not
traceable to the corpus and presented as though it were.

"Process-warrant" does not mean "trust the AI." Trust is granted in
advance, on reputation, and extends globally across an agent's
behavior. Process-warrant is earned retrospectively, from checked
samples, attaches narrowly to one bounded configuration, and is
revocable by design. The correct statement is that a process holds a
conditional, auditable license to re-present verified material — never
that the process, or the underlying model, is trusted.

## 14. Multimodal Knowledge Representation

Text, diagrams, illustrations, images, animation, audio, interactive
explanation, simulation, and physical-practice instructions are
modalities within the single Representation layer — none requires a
separate canonical concept (Attack B's test applies equally here: none
of them is diagnosable independently of Fidelity, Transferability, and
Groundedness in a way the existing layer can't already express).

Generated images specifically carry structurally distinct risk (Attack
I): no native negation, no natural check-sized units, forced
specificity where the source intended generality, and a risk of being
mistaken for photographic ground truth. Worked through the aquaponics
example — a checked article describing fish tank → nutrient-rich water
→ grow bed → plant uptake → filtered water returning to fish, with a
runtime-generated illustrative image:

The image may safely supply generic, non-factual rendering detail —
plausible coloring, plausible container shape, ordinary lighting —
because these do not assert domain facts, only generic visual
instantiation of concepts already named in the checked text
(Instrument use, per Section 13). It must never silently invent
domain-specific facts the article doesn't support: a specific ratio,
a specific species, a specific material claim, a specific safety
threshold, or any prohibition/negation not already stated in the
checked text and not unambiguously marked as prohibition in the image
itself. The learner's path to knowing which parts are illustrative
and which are verified is not solved architecturally here, but the
canonical requirement is stated precisely: a Generated Representation
must remain distinguishable, in substance, from the Checked
Representation it derives from, and the checked article must always
remain reachable from it (the Two Warrants paper's "path back"
requirement).

## 15. Bridging Generational Knowledge Gaps

Resolved by the third representational property, Groundedness
(Section 5, Attack K). Where a future reader shares few concepts with
the author — no exposure to the relevant machines, organisms, or
vocabulary — Representation's task shifts from mostly conveying the
target concept to mostly building the chain of intermediate, more
familiar concepts the target can be grounded in first: unfamiliar
concept, decomposed into progressively more primitive or analogous
concepts the reader is more likely to already hold, recomposed into
the target. This is not a new stage inserted into the canonical chain
— it is what "explained with sufficient clarity and context" always
meant, made explicit because a large generational gap makes the
grounding work the majority of the representational effort rather
than a negligible fraction of it. The canonical chain is unmodified;
its second layer's job description is completed.

## 16. Systems Knowledge and Relational Understanding

Resolved in the adversarial pass: a coupled system, where no component
is meaningful without the others, is a harder instance of Mental
Model — a graph with feedback edges rather than a simple chain — not
a different kind of concept requiring its own layer. It places a
named, specific burden on Representation's fidelity discipline (a
serial, prose-delivered Conveyance representation of a cyclical system
must deliberately mark the return edge or it will silently flatten a
loop into a line) and on Mental Model formation (capturing mutual
dependency, not just sequence). Both burdens are already inside
Representation and Understanding.

## 17. Epistemic Honesty

Four standing commitments, part of the framework rather than
courtesies added to it: truthful status always stated in substance
(no Generated Representation may present itself as, or be
indistinguishable from, Verified); the weakest-link composite rule
(mixing checked and generated content never launders the generated
part); the living license (process-warrant is continuously
re-monitored, not permanently granted); and the path back (every
Generated Representation must keep its originating Checked
Representation reachable).

## 18. The Smallest Canonical Model

See Section A, below, for the complete model. In summary: one chain,
four layers and a gate — Knowledge, Representation (with three quality
properties and two warrant modes), Understanding, and Capability,
reached through a Practice–Feedback loop (with a physically-loaded
sub-case) and gated by Mindset/Context/Physical-Readiness.

## 19. Rejected Concepts and Layers

- **Knowledge Transformation as a canonical layer** — rejected. Fully
  covered by Representation's existing fidelity discipline for
  checkable artifacts; its one genuine gap (runtime, uncheckable
  output) is covered by Process-Warrant as a status, not a layer.
- **"Knowledge Engine" as a description of the project** — rejected.
  Actively misleading: an engine implies generation, which is the
  project's categorical prohibition, not its function. "Verified
  Representation Archive" is the corrected term.
- **"Trust the AI" as a framing for process-warrant** — rejected. Trust
  is global, advance-granted, and agent-located; process-warrant is
  narrow, retrospectively-earned, and license-located. Conflating them
  invites exactly the overconfidence the framework exists to prevent.
- **Physical Readiness as a fully separate top-level canonical layer**
  — rejected. It is a gate for most domains and an additional loop
  input for physically-loaded domains; both roles are expressible
  inside the existing Practice loop and Capability gate.
- **Systems/relational understanding as a separate canonical layer** —
  rejected. A harder instance of Mental Model and a sharpened fidelity
  requirement within Representation, not a new kind of concept.
- **Runtime outputs uniformly labeled "Unverified"** — rejected as an
  alternative to the two-status distinction. Flattens two genuinely
  different epistemic situations into one label, which either
  overstates or understates each depending on direction, and the
  overstatement case is discarded by users precisely because it's
  obviously wrong.
- **"Bounded to verified knowledge" as originally phrased** — retired
  in favor of the Instrument/Authority distinction (Section 13), which
  is achievable and precise where the original phrasing was neither.

## 20. Open Philosophical Questions

See Section C, below, for the complete list. Everything else raised
across all four source papers and this synthesis has been resolved
above rather than deferred.

---

## A. Canonical Model

```
Verified Knowledge
      |   (every arrow is a transformation; drift enters at the arrow;
      |    no status crosses automatically)
      v
Representation — Conveyance or Exercise
      • quality: Fidelity, Transferability, Groundedness (independent)
      • warrant: Artifact-Warrant (-> Checked Representation, the only
        status callable "Verified") or Process-Warrant (-> Generated
        Representation, bounded/constrained/demonstrated/revocable,
        never callable "Verified") or none (-> Unverified)
      v
Understanding / Mental Model (one co-formed thing)
      v
Practice <-> Feedback (loop; for physically-loaded domains, Physical
Readiness is an additional co-input inside this loop, not only a
terminal gate)
      v
Skill  +  Experience (distinct: chosen/controlled vs. real/unstaged)
      v
[ Gate: Mindset / Context / Physical Readiness, at the moment of use ]
      v
Capability — reconstructed, one person at a time, in service of the
Charter's actual mission of offline, verified knowledge preservation.
```

## B. Canonical Laws

1. "Verified" may only ever describe a Source-Verified claim or a
   Checked Representation. It may never describe a Generated
   Representation, regardless of the reliability of the process that
   produced it.
2. Verification never crosses a change of representation
   automatically. Each new form earns its own warrant.
3. A composite representation inherits the weakest warrant present
   among its components.
4. No process may claim Process-Warrant it has not earned through
   continuous, monitored, retrospective checking of captured samples.
   Warrant is revoked, not merely discounted, when checking fails.
5. General cognitive and representational capability (language,
   structuring, inference-application, generic rendering) may serve
   as an instrument in any representation. No domain-specific factual
   content may originate anywhere but the verified corpus.
6. Image generation is held to a strictly higher demonstrated
   reliability bar than text generation, because its failure modes
   (no native negation, no checkable units, forced specificity,
   risk of being read as ground truth) are structurally harder to
   catch.
7. A Generated Representation must always remain distinguishable, in
   substance, from a Checked Representation, and its originating
   Checked Representation must always remain reachable.
8. Humanity Vault must never present, or allow AI output to imply,
   that reading alone reconstructs trained, lived competence.
   Capability Reconstruction is an accelerated and improved starting
   point, not parity with institutional training.
9. Mindset, Physical Readiness, and lived Experience are never
   claimed to be preserved or transmitted — only the documented
   conditions that historically help a person cultivate or build them
   independently.
10. This canon is subordinate to the project's actual founding
    Charter. Where a conflict is found, the Charter governs and this
    canon must be revised.

## C. Open Questions

Only what genuinely remains unresolved after this synthesis:

1. **The threshold problem.** No principled, generalizable line has
   been established for exactly how much demonstrated reliability a
   process must show before its license is granted, versus how much
   failure triggers revocation. This synthesis establishes that such
   thresholds must exist and must be continuously monitored; it does
   not and cannot, at the philosophical level, state where they sit —
   that is a domain-by-domain, evidence-based determination, likely
   different for text than for safety-critical imagery (Law 6).
2. **The reader's own epistemic competence.** The whole framework
   assumes a reader capable of noticing and caring about a status
   label ("Generated," "Checked"). Nothing in this canon establishes
   what happens, philosophically, when the reader — by age, distress,
   or unfamiliarity with the concept of verification itself — cannot
   meaningfully use that distinction. This is a real limit on
   Epistemic Honesty (Section 17) that the framework names but does
   not solve.
3. **Groundedness at the extreme.** Section 15 establishes that
   grounding scales with generational distance, but does not establish
   whether there is a distance beyond which grounding becomes
   impossible in principle — a gap too large for any chain of
   analogies to bridge — or whether human conceptual flexibility makes
   this limit effectively unreachable. Unresolved.
4. **Whether Capability Reconstruction is falsifiable.** The mission
   layer (Section 1, Attack A) is stated as an interpretation, but no
   test has been proposed by which the project could discover that
   this interpretation is *wrong* rather than merely unproven. A
   mission-layer claim immune to disconfirmation is philosophically
   weaker than the rest of this canon, which was built specifically to
   be attackable. This tension is noted, not resolved.
