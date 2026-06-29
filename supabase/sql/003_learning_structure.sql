-- ============================================================
-- EduPath Database
-- File: 003_learning_structure.sql
-- Description:
-- Core learning hierarchy
--
-- Subject
--   └── Chapter
--         └── Concept
--                └── Concept Relationships
-- ============================================================

----------------------------------------------------------
-- SUBJECTS
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.subjects (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    name TEXT NOT NULL UNIQUE,

    slug TEXT NOT NULL UNIQUE,

    description TEXT,

    icon TEXT,

    color TEXT,

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- CHAPTERS
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.chapters (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    subject_id UUID NOT NULL

        REFERENCES public.subjects(id)

        ON DELETE CASCADE,

    title TEXT NOT NULL,

    description TEXT,

    chapter_order INTEGER NOT NULL,

    estimated_minutes INTEGER DEFAULT 0,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    UNIQUE(subject_id, chapter_order)

);

----------------------------------------------------------
-- CONCEPTS
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.concepts (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    chapter_id UUID NOT NULL

        REFERENCES public.chapters(id)

        ON DELETE CASCADE,

    title TEXT NOT NULL,

    slug TEXT NOT NULL UNIQUE,

    description TEXT,

    difficulty difficulty_level

        DEFAULT 'beginner',

    estimated_minutes INTEGER DEFAULT 15,

    importance INTEGER DEFAULT 5

        CHECK (importance BETWEEN 1 AND 10),

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- CONCEPT GRAPH
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.concept_edges (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    parent_concept UUID NOT NULL

        REFERENCES public.concepts(id)

        ON DELETE CASCADE,

    child_concept UUID NOT NULL

        REFERENCES public.concepts(id)

        ON DELETE CASCADE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    CHECK(parent_concept <> child_concept),

    UNIQUE(parent_concept, child_concept)

);

----------------------------------------------------------
-- UPDATED_AT TRIGGERS
----------------------------------------------------------

CREATE TRIGGER subjects_updated_at

BEFORE UPDATE

ON public.subjects

FOR EACH ROW

EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER chapters_updated_at

BEFORE UPDATE

ON public.chapters

FOR EACH ROW

EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER concepts_updated_at

BEFORE UPDATE

ON public.concepts

FOR EACH ROW

EXECUTE FUNCTION public.set_updated_at();

----------------------------------------------------------
-- INDEXES
----------------------------------------------------------

CREATE INDEX idx_subject_name

ON public.subjects(name);

CREATE INDEX idx_chapter_subject

ON public.chapters(subject_id);

CREATE INDEX idx_concept_chapter

ON public.concepts(chapter_id);

CREATE INDEX idx_concept_slug

ON public.concepts(slug);

CREATE INDEX idx_edge_parent

ON public.concept_edges(parent_concept);

CREATE INDEX idx_edge_child

ON public.concept_edges(child_concept);

----------------------------------------------------------
-- ENABLE RLS
----------------------------------------------------------

ALTER TABLE public.subjects
ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.chapters
ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.concepts
ENABLE ROW LEVEL SECURITY;

ALTER TABLE public.concept_edges
ENABLE ROW LEVEL SECURITY;

----------------------------------------------------------
-- DEVELOPMENT POLICIES
----------------------------------------------------------

CREATE POLICY "Authenticated users can read subjects"

ON public.subjects

FOR SELECT

TO authenticated

USING (true);

CREATE POLICY "Authenticated users can read chapters"

ON public.chapters

FOR SELECT

TO authenticated

USING (true);

CREATE POLICY "Authenticated users can read concepts"

ON public.concepts

FOR SELECT

TO authenticated

USING (true);

CREATE POLICY "Authenticated users can read concept graph"

ON public.concept_edges

FOR SELECT

TO authenticated

USING (true);

----------------------------------------------------------
-- VERIFY
----------------------------------------------------------

SELECT table_name

FROM information_schema.tables

WHERE table_schema='public'

ORDER BY table_name;