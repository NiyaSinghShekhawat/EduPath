# Agent Architecture

Version: 1.0

---

# Purpose

Define every AI agent, its responsibilities, tools, inputs, outputs, and collaboration model.

---

# Agent Overview

EduPath follows an orchestrated multi-agent architecture.

One agent should never perform every task.

Instead, specialized agents collaborate.

---

# Orchestrator Agent

Role

Acts as the brain of EduPath.

Responsibilities

- Route requests
- Delegate tasks
- Combine responses
- Maintain workflow

Input

User request

Output

Execution plan

---

# Tutor Agent

Purpose

Teach concepts.

Responsibilities

- Explain topics
- Generate examples
- Simplify difficult ideas
- Answer doubts

Tools

Gemini

---

# Quiz Agent

Purpose

Assess understanding.

Responsibilities

- Generate adaptive questions
- Increase difficulty
- Evaluate responses

Outputs

- Score
- Confidence Update

---

# Memory Agent

Purpose

Maintain long-term memory.

Responsibilities

Store

- mistakes
- strengths
- weak concepts
- preferences
- revision history

Retrieve

Relevant memories before every interaction.

---

# Planner Agent

Purpose

Create intelligent study schedules.

Considers

- exam date
- available time
- weak topics
- forgetting curve

Output

Daily Study Plan

---

# Analytics Agent

Purpose

Track learning progress.

Calculates

- Memory Health
- Confidence
- Retention
- Mastery
- XP Trends

---

# Motivation Agent

Purpose

Maintain consistency.

Responsibilities

- Celebrate progress
- Award badges
- Encourage revision
- Detect burnout

---

# Resource Agent

Purpose

Recommend learning material.

Examples

- YouTube
- Notes
- PYQs
- NCERT references

---

# Collaboration Flow

Student asks

↓

Orchestrator

↓

Memory Agent

↓

Tutor

↓

Quiz

↓

Analytics

↓

Planner

↓

Dashboard Update

↓

Response