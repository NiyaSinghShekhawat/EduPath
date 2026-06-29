# API Contracts

Version: 1.0

---

# Purpose

Defines every API endpoint between frontend, backend, and AI services.

---

# Authentication

POST /auth/register

Creates a user.

---

POST /auth/login

Returns

JWT

Refresh Token

User Profile

---

POST /auth/logout

---

# User

GET /user/profile

GET /user/dashboard

PATCH /user/profile

---

# Study

POST /study/session/start

POST /study/session/end

GET /study/history

---

# CLE

POST /cle/query

Input

User message

Output

AI response

Updated memory

Recommended actions

---

POST /cle/recover

Generates today's Knowledge Recovery session.

---

POST /cle/plan

Creates today's Learning Path.

---

GET /cle/analytics

Returns

Retention Index

Learning Pulse

Memory Drift

Scholar Rank

---

# Quiz

POST /quiz/generate

POST /quiz/submit

GET /quiz/history

---

# Knowledge Constellation

GET /constellation

Returns graph nodes.

---

GET /constellation/concept/{id}

Returns

Confidence

Dependencies

History

---

# Achievements

GET /achievements

POST /achievements/claim

---

# Daily Missions

GET /missions/today

POST /missions/complete