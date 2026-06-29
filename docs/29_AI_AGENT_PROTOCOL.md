# 29_AI_AGENT_PROTOCOL.md

# EduPath AI Agent Protocol

Version: 1.0

Status: Canonical Engineering Guide

---

# Purpose

This protocol defines how any AI coding assistant (ChatGPT, Claude, Gemini, Cursor, Copilot, Codex, Windsurf, etc.) must collaborate on EduPath.

The objective is to ensure that every implementation remains consistent with the Engineering Handbook regardless of which AI assistant is used.

Documentation—not conversation history—is the project's source of truth.

---

# Primary Principles

1. Documentation First

Never invent architecture.

Never infer product requirements.

Always consult the documentation before implementing features.

---

2. Engineering First

Implementation follows documentation.

Documentation never follows implementation.

Architecture must exist before code.

---

3. Single Source of Truth

Priority order:

1. Engineering Handbook (docs/)
2. AI_CONTEXT.md
3. SESSION.md
4. Existing codebase

If documentation conflicts with implementation, documentation wins unless SESSION.md explicitly records that the documentation is pending an update.

---

# Mandatory Reading Order

For a fresh session:

1. AGENTS.md
2. AI_CONTEXT.md
3. .ai/SESSION.md

If implementing a feature:

4. Relevant Engineering Handbook documents

Example:

Authentication

→ Authentication document

AI Memory

→ Memory Architecture document

Dashboard

→ Design System

---

# Workflow

Every development session follows this lifecycle.

Step 1

Read:

AGENTS.md

AI_CONTEXT.md

SESSION.md

Step 2

Identify:

Current Sprint

Current Task

Known Constraints

Pending Decisions

Step 3

Implement

Follow all coding standards.

Respect architectural boundaries.

Avoid introducing undocumented patterns.

Step 4

Validate

Type safety

Lint

Build

Architecture consistency

Accessibility

Step 5

Document

Update SESSION.md

Update DECISIONS.md if architecture changed.

Update handbook if product behaviour changed.

---

# Architecture Protection Rules

Never:

Rename product terminology.

Change folder hierarchy.

Replace state management.

Replace backend technologies.

Introduce new frameworks.

Duplicate business logic.

Mix presentation and business logic.

Store secrets inside frontend code.

---

# AI Behaviour Rules

Always:

Explain architectural tradeoffs.

Write maintainable code.

Prefer composition.

Prefer reusable abstractions.

Respect feature boundaries.

Write self-documenting code.

Avoid premature optimization.

---

# Prompt Strategy

Every implementation request should begin with:

Read AGENTS.md

Read AI_CONTEXT.md

Read SESSION.md

Then continue implementation.

---

# Decision Logging

Every architectural decision must be recorded in:

.ai/DECISIONS.md

Include:

Decision

Reason

Alternatives

Consequences

---

# Session Management

At the end of every session update:

Completed tasks

Current task

Next task

Pending decisions

Known bugs

Current branch

Current milestone

---

# Documentation Update Policy

Documentation must be updated whenever:

Architecture changes

Database changes

Naming changes

Product behaviour changes

AI behaviour changes

Folder structure changes

---

# Repository Philosophy

EduPath prioritizes:

Readability

Maintainability

Scalability

Accessibility

Performance

Consistency

Documentation

Long-term evolution

over short-term implementation speed.

---

# AI Exit Checklist

Before ending a session ensure:

✓ Code builds

✓ Types pass

✓ Documentation updated

✓ SESSION.md updated

✓ DECISIONS.md updated (if required)

✓ No architectural violations introduced

End of Protocol.
