# Context Engineering

Version: 1.0

---

# Purpose

Defines how EduPath manages AI context windows efficiently.

---

# Context Layers

Layer 1

System Prompt

Never changes.

---

Layer 2

Student Profile

Persistent.

---

Layer 3

Session Context

Current conversation.

---

Layer 4

Retrieved Memory

Relevant long-term memory.

---

Layer 5

Learning Graph Context

Related concepts.

---

Layer 6

Current User Request

Latest message.

---

# Retrieval Strategy

Retrieve only

- related concepts
- weak topics
- recent mistakes
- relevant memories

Avoid irrelevant history.

---

# Context Compaction

Older conversations become

Summaries.

Summaries replace

raw chat history.

---

# Memory Prioritization

Highest Priority

Current topic

↓

Recent mistakes

↓

Weak concepts

↓

Learning preferences

↓

Older history

---

# Token Optimization

Limit

- examples
- duplicate explanations
- irrelevant history

Prefer

summaries

over transcripts.

---

# Explainability

Every recommendation must include

Reason

Evidence

Memory Source

Expected Benefit

---

# Failure Handling

If context exceeds limit

1. Compress

2. Summarize

3. Retrieve relevant memory

4. Continue conversation

Never discard important learning history.