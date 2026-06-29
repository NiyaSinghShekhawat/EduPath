# Learning Graph

Version: 1.0

---

# Purpose

The Learning Graph represents everything EduPath knows about a student's knowledge.

Unlike a flat progress tracker, concepts are connected through relationships.

This allows intelligent reasoning.

---

# Why a Learning Graph?

Students do not learn isolated topics.

Understanding one topic often depends on another.

Example

Calculus

↓

Derivatives

↓

Applications

↓

Optimization

If Derivatives weaken,

Applications should also lose confidence.

---

# Graph Components

## Node

Represents

- Concept
- Formula
- Chapter
- Subject

Attributes

- Confidence
- Difficulty
- Mastery
- Revision Count
- Last Reviewed
- Forgetting Probability

---

## Edge

Represents relationships.

Examples

Prerequisite

Depends On

Related Concept

Frequently Confused

Exam Sequence

---

# Example Graph

Physics

↓

Mechanics

↓

Newton's Laws

↓

Friction

↓

Inclined Plane

↓

Work Energy

---

# Confidence Score

Every node stores

0–100%

Confidence changes after

- quizzes
- explanations
- revision
- time decay

---

# Memory Health

Calculated from

Average confidence of all active concepts.

Displayed on dashboard.

---

# Graph Updates

Learning

↓

Confidence Increase

↓

Node Update

↓

Dependency Update

↓

Analytics Refresh

↓

Revision Schedule Refresh

---

# Future Extensions

- Knowledge tracing
- Graph embeddings
- Concept clustering
- AI-generated concept maps