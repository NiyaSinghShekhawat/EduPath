# EduPath — Current Session State

**Last Updated:** 2026-06-29

---

# Current Phase

Phase 2 — Backend Foundation

Project status:

🟢 Active Development

---

# Completed

## Repository

- Repository initialized
- Git configured
- Documentation finalized
- AI context documents completed
- Engineering handbook completed
- AI protocol completed

---

## Project Setup

- Next.js configured
- TypeScript configured
- Tailwind CSS configured
- ESLint configured
- Prettier configured

---

## Supabase

- Supabase project created
- Environment variables configured
- Authentication configured
- Supabase client initialized
- Server client initialized
- Middleware configured
- Database type generation configured

---

## Database

Database workflow:

**Supabase Dashboard SQL Editor First**

CLI migrations are **not** used.

All schema changes are stored inside:

supabase/sql/

The SQL files are the canonical representation of the schema.

---

## SQL Files Completed

- ✅ 001_enums.sql
- ✅ 002_profiles.sql
- ✅ 003_learning_structure.sql
- ✅ 004_user_progress.sql
- ✅ 005_assessment.sql
- ✅ 006_ai_memory.sql
- ✅ 007_gamification.sql

All corresponding tables have been successfully created in the hosted Supabase project.

---

## Database Status

Completed:

- ENUM types
- User profiles
- Subjects
- Chapters
- Concepts
- Concept graph
- User progress
- Study sessions
- Assessments
- AI memory
- Gamification foundation

Triggers created.

Indexes created.

RLS enabled where required.

---

# Architecture

EduPath follows a **Knowledge-First Architecture**.

Knowledge Graph

Subject

↓

Chapter

↓

Concept

↓

Concept Graph

↓

Resources

↓

Learning Paths

↓

User Learning

↓

Assessment

↓

AI Memory

↓

Gamification

Do not redesign this architecture.

---

# Source of Truth

Priority:

1. docs/
2. AI_CONTEXT.md
3. AGENTS.md
4. CLAUDE.md / GEMINI.md
5. SQL schema

Never contradict these documents.

---

# Current Goal

Begin backend implementation.

Priority order:

1. Authentication
2. Subject API
3. Chapter API
4. Concept API
5. Learning Graph services
6. User Progress services

No frontend work unless required.

---

# Backend Rules

Use:

- Next.js App Router
- Server Components where appropriate
- Supabase
- TypeScript
- Feature-first architecture

Business logic belongs inside:

edupath/features/*/services/

Keep controllers thin.

---

# Database Rules

Never modify the database manually without also updating:

supabase/sql/

SQL files remain the canonical schema.

Do not introduce ORM layers.

Use Supabase directly.

---

# AI Agent Instructions

When continuing development:

- Read AGENTS.md first.
- Read AI_CONTEXT.md.
- Read IMPLEMENTATION_GUIDE.md.
- Continue from current implementation.
- Never regenerate existing documentation.
- Never rewrite architecture.
- Never redesign the database.
- Preserve project conventions.

Focus only on implementing the next backend milestone.

---

# Immediate Next Task

Implement Authentication Module.

Includes:

- Sign Up
- Sign In
- Sign Out
- Session handling
- Protected routes
- Profile retrieval
- Auth service

After authentication:

Implement Subject API.

Then:

Chapter API.

Then:

Concept API.

---

# Notes

This repository uses an engineering-first workflow.

Implementation must follow the documentation.

Do not make architectural decisions without updating the documentation.

The goal is to build EduPath incrementally while preserving consistency between:

Documentation

↓

Database

↓

Backend

↓

Frontend

↓

AI Agents