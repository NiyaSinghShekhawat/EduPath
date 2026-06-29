# 30_IMPLEMENTATION_GUIDE.md

# EduPath Implementation Guide

Version: 1.0

Status: Active

---

# Purpose

This document defines the engineering workflow used to build EduPath.

It is the bridge between the Engineering Handbook and implementation.

Every feature, service, API, and AI agent must follow this guide.

---

# Development Philosophy

EduPath is developed using an Engineering-First methodology.

Implementation follows architecture.

Documentation drives implementation.

Every completed feature should be:

* Production-ready
* Type-safe
* Tested
* Documented
* Scalable

The objective is long-term maintainability rather than short-term development speed.

---

# Development Order

Features must be implemented in the following order unless explicitly approved otherwise.

## Phase 1

Project Setup

Environment

Tooling

CI/CD

Repository

Folder Structure

Completed.

---

## Phase 2

Backend Foundation

Supabase

Authentication

Database

Storage

Security

Edge Functions

Services

---

## Phase 3

Frontend Foundation

Theme

Providers

Layout

Navigation

Design System

Routing

Reusable Components

---

## Phase 4

Learning Engine

Roadmaps

Courses

Progress

Notes

Projects

Resources

Revision

---

## Phase 5

AI Platform

Planner Agent

Teacher Agent

Quiz Agent

Reviewer Agent

Mentor Agent

Memory Agent

Analytics Agent

---

## Phase 6

Adaptive Intelligence

Knowledge Graph

Recommendation Engine

Learning Analytics

Personalization

---

## Phase 7

Production Readiness

Testing

Accessibility

Performance

Monitoring

Deployment

---

# Feature Workflow

Every feature follows the same lifecycle.

1. Define Requirements

2. Design Architecture

3. Design Database (if required)

4. Define API Contract

5. Implement Service Layer

6. Implement State Management

7. Build UI

8. Testing

9. Documentation

10. Review

Never skip steps.

---

# Definition of Done

A feature is complete only if:

✓ Code builds

✓ Types pass

✓ Lint passes

✓ Tests pass

✓ Documentation updated

✓ Mobile responsive

✓ Accessible

✓ Error handling implemented

✓ Loading state implemented

✓ Empty state implemented

✓ Success state implemented

✓ Failure state implemented

---

# Folder Rules

Business logic never belongs inside components.

Services communicate with Supabase.

Hooks communicate with services.

UI communicates with hooks.

Components remain reusable.

---

# Database Rules

Every table requires:

Primary Key

created_at

updated_at

Indexes

Foreign Keys

RLS Policies

Migration

Documentation

---

# API Rules

Every endpoint must define:

Purpose

Request

Response

Authentication

Validation

Error Codes

---

# AI Rules

Each AI agent has a single responsibility.

Agents communicate only through defined interfaces.

Shared prompts belong inside prompt modules.

Never duplicate prompts.

---

# Git Workflow

feature/*

↓

Pull Request

↓

Review

↓

Merge

↓

Update SESSION.md

↓

Update CHANGELOG.md

---

# Code Review Checklist

Architecture respected

Naming consistent

No duplicated logic

No unused code

Strong typing

Reusable abstractions

Good readability

Documentation updated

---

# Testing Strategy

Unit Tests

↓

Integration Tests

↓

End-to-End Tests

---

# Performance Goals

Fast page loads

Minimal client JavaScript

Server Components by default

Optimized database queries

Lazy loading where appropriate

---

# Security Principles

Authentication first

Authorization everywhere

Never expose secrets

Validate all inputs

Least privilege access

Use Row Level Security

---

# Documentation Rules

Every significant architectural change requires updating:

Engineering Handbook

AI_CONTEXT.md

SESSION.md

DECISIONS.md (if applicable)

---

# End of Guide
