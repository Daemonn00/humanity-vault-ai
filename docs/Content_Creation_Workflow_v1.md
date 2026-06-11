# Humanity Vault Content Creation Workflow v1

## 1. Purpose

This document defines a repeatable process for producing high-quality
knowledge articles at scale. It connects two existing planning
documents:

- [Knowledge_Expansion_Roadmap_v1.md](Knowledge_Expansion_Roadmap_v1.md)
  tells contributors WHAT to write next (prioritized topics)
- [Knowledge_Authoring_Standard_v1.md](Knowledge_Authoring_Standard_v1.md)
  tells contributors HOW to format an article

This Workflow defines the PROCESS to go from "topic" to "published,
verified article": Topic Selection -> Research -> Writing ->
Verification -> Publishing.

```
  Roadmap (what)  ->  Workflow (how)  ->  Standard (format)
                          |
        Step 1: Topic Selection
        Step 2: Research
        Step 3: Writing
        Step 4: Verification
        Step 5: Publishing
```

## 2. Step 1: Topic Selection

PURPOSE: Choose the next article to write in a way that is
roadmap-aligned and avoids duplication.

PROCESS:

1. Open `docs/Knowledge_Expansion_Roadmap_v1.md` and pick the
   highest-priority unfinished item (Top 10 first, then Top 25, then
   Top 50).
2. Check the target category folder under `knowledge/<folder>/` to
   confirm the topic doesn't already exist (avoid duplicates or
   near-duplicates).
3. Confirm the category folder name and display name against
   Section 10 of the Authoring Standard (folder <-> category mapping
   table).
4. Record the chosen topic, target category/subcategory, and target
   `knowledge_level` (initial estimate) before starting research.

OUTPUT: A confirmed "article ticket" - topic title (working), target
category folder, target subcategory (if any), roadmap tier
(Top 10/25/50).

## 3. Step 2: Research

PURPOSE: Gather accurate, source-able information before writing, so
the article can be honestly assigned a `verification_level` later.

PROCESS:

1. Identify 1-3 candidate sources appropriate to the topic:
   - Survival/Medicine: WHO, Red Cross, government disaster-prep
     guides, established first-aid manuals
   - Agriculture/Construction/Engineering: agricultural extension
     guides, established trade references, textbooks
   - History/Philosophy: primary texts, well-established encyclopedic
     references
   - Islam: Qur'an, authenticated Hadith collections, recognized
     scholarly references
   - Local Wisdom: named community/traditional sources (be specific:
     "Coastal fishing communities of X region" rather than "local
     people")
2. Note down: source name, what it confirms, and how authoritative it
   is (this directly feeds Step 4's verification_level decision).
3. If NO authoritative source can be found, plan for
   `verification_level: Unverified` or `Community Verified` and flag
   the article for future review once a source is found.
4. Capture key facts, numbers, steps, and any safety warnings - do not
   rely on memory alone when writing.

OUTPUT: A short research note (can be informal/scratch) listing
sources found and their reliability tier - this becomes the basis for
the `## Sources` section and the `verification_level` field.

## 4. Step 3: Writing

PURPOSE: Produce a draft `.md` file that conforms to
`Knowledge_Authoring_Standard_v1.md`.

PROCESS:

1. Create the file at
   `knowledge/<category_folder>/<snake_case_topic>.md` following
   Section 9 (file naming) and Section 10 (category folder)
   conventions.
2. Write frontmatter:
   - `title`, `category` (required)
   - `subcategory`, `author`, `created_date`, `last_updated`
     (optional but recommended)
   - `knowledge_level`: best estimate based on Section 8 guidelines
   - `verification_level`: leave as `Unverified` or `Community
     Verified` until Step 4 confirms the final value
3. Write body sections in order:
   - `## Summary` - 1-3 sentences, written LAST (after Main Content is
     final, summarize it accurately)
   - `## Main Content` - self-contained explanation; include safety
     warnings for Level 2/3 topics
   - `## Benefits` - concrete, specific bullet points
   - `## Sources` - real, named sources from Step 2's research note
4. Use the Article-Generation Prompt Template (Section 7 below) if
   drafting with AI assistance.

OUTPUT: A draft article file, frontmatter + 4 required sections
complete, not yet reviewed.

## 5. Step 4: Verification

PURPOSE: Confirm the draft is accurate, safe, well-formatted, and
assign the final `verification_level` and `knowledge_level`.

PROCESS:

1. Run the Article-Review Checklist (Section 8) - format, structure,
   tone, naming.
2. Run the Article-Verification Checklist (Section 9) - factual
   accuracy, source quality, safety.
3. Based on Section 9 results, set the final `verification_level`
   per Standard Section 7:
   - Specific named authoritative source confirmed -> Verified Source
   - Reviewed by contributor(s) but no single authoritative source ->
     Community Verified
   - Traditional/historical practice with documented provenance ->
     Historical Source
   - Not yet reviewed -> Unverified
4. Confirm `knowledge_level` matches the actual complexity/risk per
   Standard Section 8; adjust if writing revealed it's more advanced
   or simpler than initially estimated.
5. Update `last_updated` to the verification date.

OUTPUT: A verified article file with final, accurate metadata.

## 6. Step 5: Publishing

PURPOSE: Make the article available in the app and keep planning docs
in sync.

PROCESS:

1. Confirm the file sits under an already-declared `knowledge/`
   asset path in `pubspec.yaml` (no pubspec change needed if the
   category folder is already registered).
2. Run `flutter analyze` and `flutter test` (asset/markdown changes
   don't typically affect these, but this confirms no regressions).
3. (Optional but recommended) Run a quick visual QA: rebuild
   (`flutter build web --release`), open Article List for the
   category, open the new article, confirm:
   - Title, category chip render correctly
   - Metadata bar shows expected badges/info (or is hidden if a field
     was intentionally omitted)
   - Summary/Main Content/Benefits/Sources all render, no overflow
4. Mark the article as done in `docs/Knowledge_Expansion_Roadmap_v1.md`
   (e.g. append `[EXISTS]` next to the entry) in a follow-up commit.
5. Commit with a message in the form:
   `Add article: <Title> (<Category>)`

OUTPUT: Published, app-visible article; roadmap updated to reflect
progress.

## 7. Reusable Article-Generation Prompt Template

Use this template (fill in brackets) when asking an AI assistant or a
human writer to draft a new article:

```
Write a Humanity Vault knowledge article following
docs/Knowledge_Authoring_Standard_v1.md exactly.

Topic: [TOPIC TITLE]
Category: [CATEGORY DISPLAY NAME, e.g. Survival]
Category folder: [folder_name, e.g. survival]
Subcategory (optional): [SUBCATEGORY OR "none"]
Target knowledge_level: [Level 1 / Level 2 / Level 3]
Audience: A reader with no internet access and no specialist
background, who needs to apply this knowledge safely using only
locally available materials.

Sources to draw from (do not invent sources):
- [SOURCE 1 - name and what it confirms]
- [SOURCE 2 - name and what it confirms]
- [SOURCE 3, optional]

Requirements:
1. Output a single Markdown file with YAML-style frontmatter
   (--- delimited) followed by these exact ## sections in order:
   Summary, Main Content, Benefits, Sources.
2. Frontmatter must include: title, category, subcategory (if given),
   author: "Humanity Vault Contributors", created_date: [DATE],
   last_updated: [DATE], knowledge_level: [LEVEL].
   Leave verification_level as "Unverified" - it will be set during
   review.
3. Summary: 1-3 sentences, accurate overview of Main Content.
4. Main Content: self-contained, plain language, step-by-step where
   applicable, include explicit safety warnings for any risky steps.
5. Benefits: 3-5 concrete, specific bullet points (- prefix).
6. Sources: list only the named sources provided above (- prefix).
7. Avoid time-sensitive references (URLs, "as of [year]", named
   apps/services).
8. Do not include any ## sections other than the four listed.

Output the complete file content only, ready to save as
knowledge/[folder_name]/[snake_case_filename].md
```

## 8. Reusable Article-Review Checklist

### Format & Structure

- [ ] File is named in snake_case, `.md` extension, under the correct
      `knowledge/<category_folder>/`
- [ ] Frontmatter present, delimited by `---` on its own line at top
      and after the last field
- [ ] `title` and `category` present and non-empty
- [ ] `category` value matches the folder's display name (Standard
      Section 10 table)
- [ ] If present, `subcategory`, `author`, `created_date`,
      `last_updated`, `knowledge_level`, `verification_level` use
      correct field names (snake_case) and non-empty values
- [ ] Body contains exactly these `##` sections, correctly spelled:
      Summary, Main Content, Benefits, Sources
- [ ] No extra/unsupported `##` sections (or if present, understood
      they won't render in-app)
- [ ] Benefits and Sources use `- ` or `* ` bullet formatting
- [ ] No empty sections (each has at least one sentence/bullet)

### Tone & Readability

- [ ] Summary is 1-3 sentences and accurately reflects Main Content
- [ ] Main Content is self-contained (no "see link", "as shown in the
      video", etc.)
- [ ] Plain language - no unexplained jargon or acronyms
- [ ] No time-sensitive references (dates framed as "currently", URLs,
      app/service names, "as of [year]")
- [ ] Benefits are concrete and specific, not vague filler

### Consistency

- [ ] Title in frontmatter matches the `# H1` heading (if present)
- [ ] `knowledge_level` matches Standard Section 8 guidance for this
      topic's complexity/risk
- [ ] File doesn't duplicate an existing article's topic

## 9. Reusable Article-Verification Checklist

### Source Quality

- [ ] At least one source listed in `## Sources` is a real,
      identifiable reference (organization, publication, named
      tradition/individual)
- [ ] Each factual claim in Main Content is supported by at least one
      listed source (spot-check key numbers/steps)
- [ ] If `verification_level: Verified Source` is intended, confirm at
      least one specific authoritative source is named (not just
      "Verified Source" or a generic label as the source itself)
- [ ] If no authoritative source exists, `verification_level` is set
      to `Community Verified` or `Unverified` (not `Verified Source`)

### Safety & Accuracy

- [ ] Any steps with physical risk (fire, tools, medical procedures,
      electrical/mechanical work) include explicit warnings or
      precautions
- [ ] Numbers/quantities/timings (e.g. compression rates, boil times,
      dosages) match the cited source
- [ ] No advice that could cause harm if followed literally by an
      untrained reader at the stated `knowledge_level`

### Metadata Finalization

- [ ] `verification_level` set to one of: Verified Source, Community
      Verified, Historical Source, Unverified (Standard Section 7)
- [ ] `knowledge_level` set to Level 1/2/3 reflecting actual content
      (Standard Section 8)
- [ ] `last_updated` set to the date of this verification pass
- [ ] All optional fields either present-and-correct or cleanly
      omitted (no empty values left in frontmatter)

### Sign-off

- [ ] Reviewer/verifier identity recorded (e.g. in commit message or
      `author` field if community-contributed)
- [ ] Article is ready to be marked `[EXISTS]` in
      `docs/Knowledge_Expansion_Roadmap_v1.md`
