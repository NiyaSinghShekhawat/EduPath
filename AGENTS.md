# EduPath AI Agent Guide

Before making ANY implementation decisions, read the following documents in order.

Priority:

1. docs/00_PRODUCT_PRINCIPLES.md
2. docs/01_PRODUCT_VISION.md
3. docs/02_PRODUCT_REQUIREMENTS.md
...
29. docs/28_TECH_STACK.md



Do NOT invent architecture.

Do NOT rename product concepts.

Do NOT introduce frameworks without approval.

Always follow the Engineering Handbook.

If documentation conflicts with code, documentation wins unless explicitly updated.

## Database Workflow

EduPath follows a **Supabase Dashboard–First** database workflow.

The Supabase SQL Editor is the primary environment for:

- Creating tables
- Modifying schemas
- Creating triggers
- Creating indexes
- Creating RLS policies
- Running seed scripts
- Inspecting the database

Every SQL script executed in the SQL Editor must also be saved inside:

supabase/sql/

The SQL files in this repository are the source of truth.

Supabase CLI migrations are optional and are not required for development.

After database changes are applied, regenerate TypeScript database types when needed.