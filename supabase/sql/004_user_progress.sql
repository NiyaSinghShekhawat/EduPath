-- ============================================================
-- EduPath Database
-- File: 004_user_progress.sql
-- Description:
-- Milestone 4 — Personalized Learning
-- Tracks every learner's concept mastery, study sessions,
-- progress, notes, bookmarks, and revision scheduling.
--
-- Depends on: 001_enums.sql, 002_profiles.sql, 003_learning_structure.sql
-- ============================================================

----------------------------------------------------------
-- USER CONCEPTS
-- Per-student mastery state for each concept.
-- The node state inside the Knowledge Constellation.
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.user_concepts (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    concept_id UUID NOT NULL
        REFERENCES public.concepts(id)
        ON DELETE CASCADE,

    mastery_level mastery_level
        NOT NULL DEFAULT 'unknown',

    confidence_score INTEGER NOT NULL DEFAULT 0
        CHECK (confidence_score BETWEEN 0 AND 100),

    memory_strength memory_strength
        NOT NULL DEFAULT 'weak',

    revision_count INTEGER NOT NULL DEFAULT 0,

    last_reviewed_at TIMESTAMPTZ,

    next_review_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    UNIQUE(user_id, concept_id)

);

----------------------------------------------------------
-- STUDY SESSIONS
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.study_sessions (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    concept_id UUID
        REFERENCES public.concepts(id)
        ON DELETE SET NULL,

    status session_status NOT NULL DEFAULT 'planned',

    started_at TIMESTAMPTZ,

    ended_at TIMESTAMPTZ,

    duration_minutes INTEGER DEFAULT 0,

    notes TEXT,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- REVISION SESSIONS
-- Tracks spaced repetition review events.
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.revision_sessions (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    concept_id UUID NOT NULL
        REFERENCES public.concepts(id)
        ON DELETE CASCADE,

    score INTEGER NOT NULL DEFAULT 0
        CHECK (score BETWEEN 0 AND 100),

    confidence_before INTEGER
        CHECK (confidence_before BETWEEN 0 AND 100),

    confidence_after INTEGER
        CHECK (confidence_after BETWEEN 0 AND 100),

    reviewed_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- NOTES
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.notes (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    concept_id UUID
        REFERENCES public.concepts(id)
        ON DELETE SET NULL,

    title TEXT,

    content TEXT NOT NULL,

    is_pinned BOOLEAN NOT NULL DEFAULT FALSE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- BOOKMARKS
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.bookmarks (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    concept_id UUID NOT NULL
        REFERENCES public.concepts(id)
        ON DELETE CASCADE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    UNIQUE(user_id, concept_id)

);

----------------------------------------------------------
-- UPDATED_AT TRIGGERS
----------------------------------------------------------

CREATE TRIGGER user_concepts_updated_at
BEFORE UPDATE ON public.user_concepts
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER study_sessions_updated_at
BEFORE UPDATE ON public.study_sessions
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER notes_updated_at
BEFORE UPDATE ON public.notes
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

----------------------------------------------------------
-- INDEXES
----------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_user_concepts_user_id
ON public.user_concepts(user_id);

CREATE INDEX IF NOT EXISTS idx_user_concepts_concept_id
ON public.user_concepts(concept_id);

CREATE INDEX IF NOT EXISTS idx_user_concepts_mastery
ON public.user_concepts(user_id, mastery_level);

CREATE INDEX IF NOT EXISTS idx_user_concepts_next_review
ON public.user_concepts(user_id, next_review_at ASC NULLS FIRST);

CREATE INDEX IF NOT EXISTS idx_user_concepts_confidence
ON public.user_concepts(user_id, confidence_score ASC);

CREATE INDEX IF NOT EXISTS idx_study_sessions_user_id
ON public.study_sessions(user_id);

CREATE INDEX IF NOT EXISTS idx_study_sessions_status
ON public.study_sessions(user_id, status);

CREATE INDEX IF NOT EXISTS idx_study_sessions_started
ON public.study_sessions(user_id, started_at DESC);

CREATE INDEX IF NOT EXISTS idx_revision_sessions_user_id
ON public.revision_sessions(user_id);

CREATE INDEX IF NOT EXISTS idx_revision_sessions_concept
ON public.revision_sessions(user_id, concept_id);

CREATE INDEX IF NOT EXISTS idx_notes_user_id
ON public.notes(user_id);

CREATE INDEX IF NOT EXISTS idx_notes_concept_id
ON public.notes(concept_id);

CREATE INDEX IF NOT EXISTS idx_bookmarks_user_id
ON public.bookmarks(user_id);

----------------------------------------------------------
-- ENABLE RLS
----------------------------------------------------------

ALTER TABLE public.user_concepts      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.study_sessions     ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.revision_sessions  ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.notes              ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.bookmarks          ENABLE ROW LEVEL SECURITY;

----------------------------------------------------------
-- RLS POLICIES
----------------------------------------------------------

CREATE POLICY "Users can manage own concept mastery"
ON public.user_concepts
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage own study sessions"
ON public.study_sessions
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage own revision sessions"
ON public.revision_sessions
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage own notes"
ON public.notes
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

CREATE POLICY "Users can manage own bookmarks"
ON public.bookmarks
FOR ALL
TO authenticated
USING (auth.uid() = user_id)
WITH CHECK (auth.uid() = user_id);

