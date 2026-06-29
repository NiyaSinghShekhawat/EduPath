# Database Schema

Version: 1.0

Status: Core Engineering

---

# Purpose

Defines the relational data model for EduPath.

The schema is designed to support:

- Persistent Memory
- Multi-Agent Learning
- Adaptive Recall
- Analytics
- Gamification
- CLE

---

# Database

PostgreSQL

---

# Entity Overview

Users

↓

Study Sessions

↓

Concepts

↓

Knowledge Constellation

↓

Memory

↓

Quiz Attempts

↓

Analytics

↓

Gamification

---

# Tables

## users

Stores student profile.

Fields

- id
- name
- email
- password_hash
- grade
- target_exam
- exam_date
- timezone
- created_at
- updated_at

---

## subjects

Fields

- id
- name
- color

---

## chapters

Fields

- id
- subject_id
- name

---

## concepts

Fields

- id
- chapter_id
- name
- description
- difficulty
- importance_weight

---

## concept_edges

Represents Knowledge Constellation relationships.

Fields

- id
- parent_concept
- child_concept
- relationship_type

Examples

Prerequisite

Related

Frequently Confused

Extension

---

## study_sessions

Fields

- id
- user_id
- start_time
- end_time
- duration
- topic
- notes

---

## user_concepts

Stores mastery per student.

Fields

- id
- user_id
- concept_id
- confidence_score
- mastery_level
- retention_index
- memory_drift
- revision_count
- last_reviewed

---

## quizzes

Fields

- id
- topic
- difficulty
- created_by_agent

---

## quiz_attempts

Fields

- id
- quiz_id
- user_id
- score
- time_taken
- confidence_before
- confidence_after

---

## memory_entries

Stores long-term AI memory.

Fields

- id
- user_id
- memory_type
- summary
- embedding_id
- created_at

---

## achievements

Fields

- id
- name
- description
- icon

---

## user_achievements

Fields

- id
- user_id
- achievement_id
- earned_at

---

## daily_missions

Fields

- id
- title
- objective
- reward_kp

---

## analytics

Fields

- id
- user_id
- retention_index
- learning_pulse
- scholar_rank
- weekly_growth
- updated_at

---

# Future Tables

notifications

resources

study_plans

flashcards

parents

teachers

AI_feedback

---

# Relationships

User

↓

Sessions

↓

Concepts

↓

Quizzes

↓

Analytics

↓

Achievements

---

# Design Principles

- Normalized schema
- UUID primary keys
- Foreign key constraints
- Indexed search fields
- Soft deletes where appropriate