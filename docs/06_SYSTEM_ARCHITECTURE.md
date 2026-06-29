# System Architecture

Version: 1.0

Status: Draft

---

# Purpose

Define the high-level architecture of EduPath and the responsibilities of each major subsystem.

---

# Architecture Overview

                User
                  │
                  ▼
        Next.js Frontend
                  │
                  ▼
          FastAPI Backend
                  │
        ┌─────────┴─────────┐
        ▼                   ▼
 Authentication      Google ADK Runtime
                            │
                 Orchestrator Agent
                            │
 ┌────────┬────────┬────────┬────────┬────────┐
 ▼        ▼        ▼        ▼        ▼
Tutor  Planner  Quiz   Memory  Analytics
Agent   Agent   Agent   Agent    Agent
                            │
                  Learning Graph
                            │
                    PostgreSQL
                            │
                     Gemini API

---

# System Layers

## Presentation Layer

Responsible for:

- Dashboard
- Chat Interface
- Analytics
- Study Planner
- Memory Health
- Achievements

Technology

- Next.js
- TailwindCSS
- shadcn/ui

---

## Backend Layer

Responsibilities

- Authentication
- Business Logic
- API
- Session Management
- Agent Communication

Technology

FastAPI

---

## AI Layer

Contains

- Orchestrator
- Specialized Agents
- Prompt Builder
- Context Engineering
- Memory Retrieval

Technology

Google ADK

---

## Memory Layer

Stores

- Conversations
- Topic Mastery
- Confidence
- Learning History
- Revision History
- Achievements

---

## Database Layer

Persistent storage for

- Users
- Sessions
- Topics
- Learning Graph
- Analytics
- XP
- Streaks

---

# Core Design Principles

- Modular Architecture
- Service-Oriented Backend
- Agent Isolation
- Stateless APIs
- Persistent User Memory
- Explainable AI Decisions

---

# Data Flow

User Question

↓

Orchestrator

↓

Memory Retrieval

↓

Relevant Agents

↓

Response Generation

↓

Memory Update

↓

Dashboard Refresh