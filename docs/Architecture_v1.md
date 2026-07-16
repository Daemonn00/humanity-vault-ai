# Humanity Vault AI - Architecture v1

## Status Notice

This document is a **long-range architectural vision**, written early
in the project's life. It is not a declaration that every component
described below currently exists, and it should not be read as
current, enforced architecture. Several concepts here (SQLite, FAISS,
a `llama.cpp`/GGUF AI Runtime Layer, the `.hvs` Knowledge Seed format,
a full "Media" database table, the broader source-label list in
Section 11) are not implemented in the repository today. The
currently-implemented system is simpler: Markdown files loaded via
Flutter's `AssetManifest`, no database, no AI runtime, and Official
Knowledge Packs distributed as ZIP archives (see
`docs/Knowledge_Authoring_Standard_v1.md`, `registry_generator/`, and
`release_pipeline/` for the actual, current, authoritative
implementation).

This document's ideas are preserved, not deleted or rewritten to
match current code - they remain a legitimate long-range direction.
Actual implementation status must always be determined from the
repository and from current implementation documentation
(`docs/Knowledge_Authoring_Standard_v1.md`, `README.md`,
`humanity_vault_app/README.md`), never assumed from this document
alone. Any future implementation of ideas described here remains
subject to `docs/Project_Charter_v1.md` and
`docs/Canon_Philosophy_v1.md`. No specific technology named below
(SQLite, FAISS, llama.cpp, GGUF, or any named model family) is
permanently locked in merely because it appears in this document -
these are illustrative choices from an early planning pass, not
binding commitments.

The Visual Knowledge Engine vision in Section 9 - including its
stated priority order (Real Photos, then Technical Diagrams, then
Educational Illustrations, then AI Generated Visuals) and its "AI
visuals must be labeled" rule - remains intact below and is not
contradicted by `docs/Canon_Philosophy_v1.md`; the Canon gives this
long-standing vision a more rigorous foundation (see the Canon's
Sections 6, 7, and 14) rather than replacing it.

## 1. System Overview

Humanity Vault AI is an offline-first knowledge preservation platform designed to store, distribute, search, verify, and preserve practical, scientific, cultural, historical, ethical, and spiritual knowledge.

Core philosophy:

Knowledge First.
AI Optional.

The application must remain useful even when:

* Internet is unavailable
* AI models are unavailable
* Cloud services are unavailable
* Infrastructure is unavailable

The system consists of six major layers:

1. Knowledge Layer
2. Search Layer
3. Visual Knowledge Layer
4. Knowledge Seed Layer
5. AI Runtime Layer
6. Legacy Preservation Layer

---

## 2. Recommended Technology Stack

### Frontend

Flutter

Reasons:

* Android first
* Cross-platform
* Future desktop support
* Large ecosystem
* Strong offline capabilities

### State Management

Riverpod

### Local Database

SQLite

### Full Text Search

SQLite FTS5

### Semantic Search (Future)

FAISS

or equivalent local vector storage

### Local Storage

Application Documents Directory

### AI Runtime

llama.cpp

### Model Formats

GGUF

### Future AI Runtime Compatibility

* Qwen
* Gemma
* Llama
* DeepSeek
* Mistral
* Phi
* Future Open Source Models

---

## 3. Mobile App Architecture

Architecture Pattern:

Feature First + Clean Architecture

Layers:

Presentation Layer

* Screens
* Widgets
* Navigation

Application Layer

* Use Cases
* Business Logic

Domain Layer

* Entities
* Interfaces

Infrastructure Layer

* Database
* File Storage
* Search Engine
* AI Runtime

---

## 4. Folder Structure

/docs

/assets

/knowledge

/seeds

/src

/src/core
/src/features

/src/features/library

/src/features/search

/src/features/emergency

/src/features/seeds

/src/features/visuals

/src/features/legacy

/src/features/settings

/src/features/ai

/src/shared

---

## 5. Database Schema

### Categories

categories

* id
* name
* description
* parent_id

### Articles

articles

* id
* title
* slug
* category_id
* summary
* content_path
* source_type
* verification_level
* created_at
* updated_at

### Tags

tags

* id
* name

### Article Tags

article_tags

* article_id
* tag_id

### Media

media

* id
* article_id
* media_type
* file_path
* description

### Knowledge Seeds

knowledge_seeds

* id
* name
* version
* author
* checksum
* created_at

### Legacy Vault

legacy_entries

* id
* title
* content_path
* author
* created_at

---

## 6. Knowledge Storage Format

Primary Format:

Markdown (.md)

Benefits:

* Human readable
* Version control friendly
* Easy contributions
* Open format

Structure:

knowledge/

survival/

medicine/

agriculture/

engineering/

electronics/

construction/

history/

philosophy/

islam/

local_wisdom/

Example:

knowledge/survival/water_purification.md

knowledge/islam/seerah/battle_of_badr.md

---

## 7. Search System Design

Phase 1

Keyword Search

SQLite FTS5

Capabilities:

* Fast
* Offline
* Lightweight

Phase 2

Semantic Search

Embeddings

Vector Index

Capabilities:

* Meaning-based search
* AI assisted retrieval

---

## 8. Knowledge Seed Design

Knowledge Seed is a portable package.

File Extension:

.hvs

Humanity Vault Seed

Contents:

manifest.json

articles/

images/

audio/

videos/

metadata/

Signature:

SHA256

Future:

Digital Signatures

Supported Transfer Methods:

* Bluetooth
* Wi-Fi Direct
* USB OTG
* SD Card
* Local Network

---

## 9. Visual Knowledge Engine

Purpose:

Provide visual verification and educational references.

Categories:

### Survival

* Shelters
* Knots
* Fire Building
* Water Filtration

### Foraging

* Edible Plants
* Poisonous Plants
* Fruits
* Mushrooms

### Wildlife

* Animal Tracks
* Fish
* Shellfish
* Insects

### Construction

* Carpentry
* Masonry
* Roofing

### Medicine

* CPR
* Wound Care
* Anatomy

Priority Order:

1. Real Photos
2. Technical Diagrams
3. Educational Illustrations
4. AI Generated Visuals

AI visuals must be labeled.

---

## 10. Future AI Integration

AI is optional.

Knowledge remains usable without AI.

Architecture:

User

↓

Knowledge Retrieval

↓

AI Runtime

↓

Response

Features:

* User Selectable Models
* Multiple Model Support
* Offline Operation
* Model Manager

Supported Families:

* Qwen
* Gemma
* Llama
* DeepSeek
* Mistral
* Phi

Future models should work without redesigning the application.

---

## 11. Truth Layer

**Status note:** the list below is an early, exploratory sketch of
*source-type/provenance* categories (what kind of authority backs a
claim - a government publication, an academic paper, a named
tradition), not the currently-enforced *verification-status* enum.
The actual, currently-implemented and enforced values are the four
`verification_level` values defined in
`docs/Knowledge_Authoring_Standard_v1.md` Section 7 (`Verified
Source`, `Community Verified`, `Historical Source`, `Unverified`),
which describe how confirmed a claim is, not what kind of source backs
it. These are two different, non-overlapping questions that this
early sketch did not yet distinguish - notably, "Verified Source"
appears in both lists but is used differently in each: here as one
peer example among several source types, and in the actual enforced
enum as the strongest of four ordered confidence levels. This section
is preserved as historical/exploratory vision, not as an alternate or
superseded verification standard - `Knowledge_Authoring_Standard_v1.md`
Section 7 is the sole authoritative source for `verification_level`
values, and nothing in this section changes that.

Every knowledge item receives a source label.

Examples:

Verified Source

Government Source

Academic Source

Medical Source

Islamic Primary Source

Community Source

AI Summary

Users must always know the origin of information.

---

## 12. Security & Privacy

No telemetry.

No tracking.

No mandatory accounts.

No cloud dependency.

All user data remains local.

Optional encrypted Legacy Vault.

Optional encrypted Knowledge Seeds.

---

## 13. Scalability Considerations

The architecture must support:

* 100,000+ articles
* Millions of images
* Thousands of Knowledge Seeds
* Hundreds of AI models
* Community contributions

without changing core architecture.

---

## 14. MVP v0.1

No AI.

Core Features:

* Browse Categories
* Open Articles
* Search Articles
* Emergency Mode
* Knowledge Seeds Import
* Knowledge Seeds Export

Goal:

Create a useful offline knowledge platform before introducing AI.

Success Metric:

A user can access critical information and share knowledge completely offline.

---

## 15. Long-Term Vision

Humanity Vault AI aims to become a global open-source platform for preserving and distributing human knowledge.

The mission extends beyond survival.

The mission is preserving civilization, wisdom, culture, science, faith, and practical knowledge for future generations.
