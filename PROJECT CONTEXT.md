# PROJECT_CONTEXT.md

# EduPath — AI Learning Operating System

**Version:** 1.0

**Status:** Active Development

**Competition:** Kaggle x Google Vibe Coding Capstone

---

# Project Overview

EduPath is an AI-powered Learning Operating System designed to improve long-term knowledge retention rather than simply answering academic questions.

Unlike traditional AI tutors that respond only when prompted, EduPath continuously observes, remembers, plans, and adapts to each student's learning journey.

The system combines persistent memory, adaptive revision scheduling, intelligent multi-agent orchestration, and gamification to help students prepare effectively for competitive examinations such as JEE, NEET, and board examinations.

---

# Mission

To build an AI learning companion that ensures students remember what they learn until exam day.

---

# Vision

Every student deserves a personalized mentor that understands:

* What they know
* What they forgot
* What they struggle with
* How they learn best
* When they should revise
* How to keep them motivated

EduPath aims to become that mentor.

---

# Core Philosophy

EduPath is NOT:

* another chatbot
* another quiz generator
* another study planner

EduPath IS:

* a persistent learning companion
* an adaptive memory system
* an intelligent study planner
* a long-term academic mentor

---

# Problem Statement

Millions of students preparing for competitive examinations rely on fragmented resources.

Current solutions typically:

* forget previous conversations
* provide generic explanations
* lack long-term planning
* ignore forgetting patterns
* cannot adapt revision schedules
* fail to build confidence progressively

Students often spend months studying only to forget previously mastered concepts.

EduPath addresses this problem using persistent AI memory and Knowledge Recovery Engine.

---

# Target Users

Primary

* JEE Aspirants
* NEET Aspirants
* CBSE Board Students
* State Board Students

Secondary

* College students
* Self learners

---

# Product Goals

The system should:

✓ Remember every study session

✓ Track conceptual understanding

✓ Predict forgetting

✓ Generate adaptive revision

✓ Build confidence gradually

✓ Reward consistency

✓ Create personalized study plans

✓ Provide measurable progress

---

# Unique Selling Proposition

EduPath does not simply teach.

It actively protects the student's knowledge over time.

---

# High-Level Architecture

User

↓

Frontend Dashboard

↓

FastAPI Backend

↓

Google ADK

↓

Orchestrator Agent

↓

Specialized Agents

↓

Knowledge Constellation (Learning Graph)

↓

Cognitive Learning Engine (CLE)

↓

Database

↓

Gemini API

---

# Core Components

## Knowledge Constellation (Learning Graph)

Stores relationships between concepts, confidence scores, prerequisites, and revision history.

---

## Cognitive Learning Engine (CLE)

Maintains persistent student memory across sessions.

Stores:

* concepts studied
* weak topics
* mistakes
* confidence
* learning style
* achievements

---

## Knowledge Recovery Engine

Uses memory health and forgetting probability to generate personalized revision schedules.

The objective is maximizing long-term retention.

---

## Gamification Engine

Encourages consistent study behavior through:

* XP
* achievements
* streaks
* badges
* memory recovery rewards
* mastery progression

---

## Multi-Agent Architecture

Orchestrator Agent

Coordinates all agent communication.

Tutor Agent

Explains concepts.

Quiz Agent

Generates adaptive questions.

Planner Agent

Creates study plans.

Memory Agent

Maintains long-term memory.

Analytics Agent

Measures learning progress.

Motivation Agent

Provides encouragement and rewards.

Resource Agent

Suggests external learning resources.

---

# AI Design Principles

Every AI feature must satisfy at least one of the following:

* improves personalization
* improves long-term retention
* improves motivation
* reduces cognitive load
* improves exam readiness

Features that do not satisfy these principles should not be implemented.

---

# Technical Stack

Frontend

* Next.js
* TypeScript
* TailwindCSS
* shadcn/ui

Backend

* FastAPI

AI

* Google Gemini
* Google ADK

Database

* PostgreSQL

Vector Storage

* ChromaDB (planned)

Deployment

* Vercel
* Cloud Run

---

# Coding Standards

Business logic belongs inside services.

Agents must remain modular.

Avoid duplicate code.

Every API must be documented.

Prefer composition over inheritance.

All backend code should be asynchronous wherever practical.

Never hardcode prompts.

Configuration should live inside environment variables.

---

# Success Metrics

A successful MVP should demonstrate:

✓ Persistent memory

✓ Multi-agent collaboration

✓ Adaptive revision scheduling

✓ Personalized learning experience

✓ Context engineering

✓ Professional UI

✓ Deployment

---

# Guiding Principle

Every feature should answer one question:

"Does this help the student remember better?"

If the answer is no, reconsider whether the feature belongs in EduPath.
