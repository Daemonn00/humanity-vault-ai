# Reviewer Sign-off Template

A repeatable block - copy it once per reviewer, per review pass. A
pack may have any number of reviewers, and a single reviewer may sign
off more than once across a pack's lifetime (e.g. once at v1.0.0, again
after a v1.1.0 revision). There is no reviewer account system; a
"reviewer" is just a name or handle written in plain text, consistent
with the rest of this project.

Copy this block into `REVIEW_NOTES.md`'s "Reviewer Sign-offs" section,
appending a new block for each reviewer rather than overwriting a
previous one.

## Sign-off block

- **Reviewer name/handle:**
- **Date:**
- **Scope of this review** - be specific about what was actually
  covered, not just "the pack":
  - Articles reviewed:
  - Claims reviewed (reference row numbers/claims from
    `03_CLAIM_VERIFICATION_TEMPLATE.md`'s table, or "all claims in the
    articles listed above"):
  - Sources personally opened and read as part of this review
    (reference entries in the Source Access Log):
- **Findings:**
  - [ ] No issues found within this scope.
  - [ ] Issues found - listed below, with resolution status:
    - *(issue)* - *(resolved how, or still open)*
- **Statement:**
  > I confirm that, within the scope listed above, every claim marked
  > "Directly verified: Yes" in the claim table was checked by me
  > personally against the source's actual content, not a summary or
  > description of it.
- **Signed:** *(name/handle)*, *(date)*

## Partial review is normal

It is expected and fine for one reviewer to sign off on only some
articles or claims, with a different reviewer covering the rest -
exactly as happened for the real, existing example pack, where a
single article's source was directly reviewed and signed off while
three others remained open. Each reviewer's block should honestly
reflect only what *they* actually checked - never sign off on scope
you did not personally verify, even if a co-reviewer already has.
