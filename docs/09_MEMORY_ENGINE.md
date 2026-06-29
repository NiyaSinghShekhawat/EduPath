# Memory Engine

Version: 1.0

Status: Core Component

---

# Purpose

The Memory Engine is responsible for maintaining a persistent understanding of each student's learning journey.

Unlike traditional chatbots, EduPath does not forget previous interactions.

Every study session contributes to a growing student profile that enables personalization across weeks and months.

---

# Objectives

The Memory Engine should:

- Remember previous learning sessions.
- Store strengths and weaknesses.
- Track conceptual understanding.
- Adapt future recommendations.
- Improve personalization over time.

---

# Memory Categories

## User Profile

Stores:

- Name
- Exam Goal
- Grade
- Subjects
- Target Exam Date

---

## Learning History

Stores:

- Topics Studied
- Study Duration
- Session Date
- Resources Used

---

## Performance Memory

Stores:

- Quiz Scores
- Incorrect Questions
- Frequently Mistaken Concepts
- Improvement Trends

---

## Confidence Memory

Each concept stores:

- Confidence Score
- Mastery Level
- Last Reviewed
- Revision Count
- Forgetting Probability

---

## Behavioral Memory

Learns:

- Preferred Study Time
- Average Session Length
- Learning Pace
- Strongest Subject
- Weakest Subject

---

# Memory Lifecycle

Student Studies

↓

Memory Updated

↓

Confidence Recalculated

↓

Learning Graph Updated

↓

Adaptive Recall Updated

↓

Dashboard Refreshed

---

# Retrieval Strategy

Before answering any question, the Memory Agent retrieves:

- Related concepts
- Recent mistakes
- Current confidence
- Revision history
- Learning preferences

This ensures every response is personalized.

---

# Memory Expiration

No permanent deletion.

Old memories become lower priority but remain accessible for long-term analysis.

---

# Explainability

Every recommendation must reference stored memory.

Example:

"We're reviewing Thermodynamics because you struggled with related questions last week."

---

# Future Enhancements

- Semantic memory search.
- Vector embeddings.
- Learning clusters.
- Cross-subject reasoning.