-- ============================================================
-- EduPath Database
-- File: 006_ai_memory.sql
-- Description:
-- Milestone 6 — AI Memory Layer
-- Persists the Cognitive Learning Engine's understanding
-- of each learner across sessions.
--
-- Depends on: 001_enums.sql, 002_profiles.sql, 003_learning_structure.sql
-- ============================================================

----------------------------------------------------------
-- MEMORY ENTRIES
-- Long-term AI memory store.
-- Each row is one memory unit about a student.
-- See doc/09_MEMORY_ENGINE.md
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.memory_entries (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    agent ai_agent NOT NULL DEFAULT 'memory',

    memory_type TEXT NOT NULL,

    summary TEXT NOT NULL,

    concept_id UUID
        REFERENCES public.concepts(id)
        ON DELETE SET NULL,

    relevance INTEGER NOT NULL DEFAULT 5
        CHECK (relevance BETWEEN 1 AND 10),

    embedding_id TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- AI CONVERSATIONS
-- Full conversation history per student session.
-- Used for context engineering and memory retrieval.
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.ai_conversations (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    agent ai_agent NOT NULL DEFAULT 'teacher',

    role TEXT NOT NULL CHECK (role IN ('user', 'assistant', 'system')),

    content TEXT NOT NULL,

    concept_id UUID
        REFERENCES public.concepts(id)
        ON DELETE SET NULL,

    session_id UUID,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- RECOMMENDATIONS
-- AI-generated learning recommendations.
-- Produced by the Planner Agent and Analytics Agent.
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.recommendations (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    concept_id UUID
        REFERENCES public.concepts(id)
        ON DELETE SET NULL,

    agent ai_agent NOT NULL DEFAULT 'planner',

    reason TEXT NOT NULL,

    priority INTEGER NOT NULL DEFAULT 5
        CHECK (priority BETWEEN 1 AND 10),

    is_completed BOOLEAN NOT NULL DEFAULT FALSE,

    completed_at TIMESTAMPTZ,

    expires_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- UPDATED_AT TRIGGERS
----------------------------------------------------------

CREATE TRIGGER memory_entries_updated_at
BEFORE UPDATE ON public.memory_entries
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER recommendations_updated_at
BEFORE UPDATE ON public.recommendations
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

----------------------------------------------------------
-- INDEXES
----------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_memory_entries_user_id
ON public.memory_entries(user_id);

CREATE INDEX IF NOT EXISTS idx_memory_entries_type
ON public.memory_entries(user_id, memory_type);

CREATE INDEX IF NOT EXISTS idx_memory_entries_concept
ON public.memory_entries(concept_id);

CREATE INDEX IF NOT EXISTS idx_memory_entries_relevance
ON public.memory_entries(user_id, relevance DESC);

CREATE INDEX IF NOT EXISTS idx_memory_entries_recent
ON public.memory_entries(user_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_ai_conversations_user_id
ON public.ai_conversations(user_id);

CREATE INDEX IF NOT EXISTS idx_ai_conversations_session
ON public.ai_conversations(session_id);

CREATE INDEX IF NOT EXISTS idx_ai_conversations_recent
ON public.ai_conversations(user_id, created_at DESC);

CREATE INDEX IF NOT EXISTS idx_recommendations_user_id
ON public.recommendations(user_id);

CREATE INDEX IF NOT EXISTS idx_recommendations_priority
ON public.recommendations(user_id, priority DESC);

CREATE INDEX IF NOT EXISTS idx_recommendations_active
ON public.recommendations(user_id, is_completed)
WHERE is_completed = FALSE;

----------------------------------------------------------
-- ENABLE RLS
----------------------------------------------------------

ALTER TABLE public.memory_entries    ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.ai_conversations  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.recommendations   ENABLE ROW LEVEL SECURITY;

----------------------------------------------------------
-- RLS POLICIES
----------------------------------------------------------

CREATE POLICY "Users can manage own memory"
ON public.memory_entries
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage own conversations"
ON public.ai_conversations
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can read own recommendations"
ON public.recommendations
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

----------------------------------------------------------
-- VERIFY
----------------------------------------------------------

SELECT table_name
FROM information_schema.tables
WHERE table_schema = 'public'
ORDER BY table_name;