# AI_CONTEXT.md

# EduPath Project Context

Version: 1.0

---

## Mission

EduPath is an AI-powered adaptive learning platform designed to help learners study more effectively through personalized learning paths, intelligent tutoring, spaced revision, progress tracking, and a multi-agent cognitive learning engine.

The goal is not simply to deliver educational content, but to become an intelligent learning companion.

---

## Product Vision

EduPath combines:

* AI tutoring
* Personalized learning
* Project-based education
* Revision scheduling
* Knowledge graphs
* Analytics
* Long-term memory

into one cohesive platform.

---

## Core Principles

Engineering First

Documentation Driven

Feature-first Architecture

Strict TypeScript

Accessibility First

Reusable Components

Scalable Backend

Maintainable Code

---

## Technology Stack

Frontend

* Next.js App Router
* React
* TypeScript
* Tailwind CSS
* shadcn/ui

Backend

* Supabase
* PostgreSQL

State

* Zustand
* TanStack Query

AI

* OpenAI
* LangGraph
* LangChain

Deployment

* Vercel

---

## Architecture

Frontend

↓

Application Layer

↓

Services

↓

Supabase

↓

AI Layer

↓

Multi-Agent System

Never place business logic inside UI components.

---

## AI Agents

Planner

Teacher

Quiz

Reviewer

Mentor

Memory

Analytics

Each agent has a single responsibility.

---

## Learning Engine

Adaptive Roadmaps

Projects

Quizzes

Flashcards

Revision

Progress Tracking

Recommendations

Learning Analytics

---

## Folder Philosophy

Feature-first organization.

Shared components remain generic.

Business logic belongs in services.

Prompts belong in dedicated prompt modules.

---

## Coding Standards

Strict TypeScript

No any

Reusable hooks

Server Components by default

Client Components only when necessary

Consistent naming

Readable code

---

## Design Philosophy

Modern

Minimal

Educational

Professional

Responsive

Accessible

Consistent

---

## Current Development Phase

Refer to:

.ai/SESSION.md

---

## Current Architecture

Refer to:

Engineering Handbook

---

## Current Sprint

Refer to:

.ai/SESSION.md

---

## Decision History

Refer to:

.ai/DECISIONS.md

---

## Repository Entry Point

Every AI assistant should begin with:

1. AGENTS.md

2. AI_CONTEXT.md

3. .ai/SESSION.md

before making implementation decisions.

End of Context.
