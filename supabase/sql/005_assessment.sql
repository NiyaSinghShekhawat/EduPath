-- ============================================================
-- EduPath Database
-- File: 005_assessment.sql
-- Description:
-- Milestone 5 — Assessment System
-- Quiz engine, questions, attempts, and scoring.
--
-- Depends on: 001_enums.sql, 002_profiles.sql, 003_learning_structure.sql
-- ============================================================

----------------------------------------------------------
-- QUIZZES
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.quizzes (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    concept_id UUID
        REFERENCES public.concepts(id)
        ON DELETE SET NULL,

    title TEXT NOT NULL,

    description TEXT,

    difficulty difficulty_level NOT NULL DEFAULT 'beginner',

    status quiz_status NOT NULL DEFAULT 'draft',

    question_count INTEGER NOT NULL DEFAULT 0,

    time_limit_minutes INTEGER,

    created_by_agent ai_agent,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- QUESTIONS
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.questions (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    quiz_id UUID NOT NULL
        REFERENCES public.quizzes(id)
        ON DELETE CASCADE,

    concept_id UUID
        REFERENCES public.concepts(id)
        ON DELETE SET NULL,

    question_text TEXT NOT NULL,

    question_type question_type NOT NULL DEFAULT 'mcq',

    options JSONB,

    correct_answer TEXT NOT NULL,

    explanation TEXT,

    difficulty difficulty_level NOT NULL DEFAULT 'beginner',

    points INTEGER NOT NULL DEFAULT 10,

    order_index INTEGER NOT NULL DEFAULT 0,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- QUIZ ATTEMPTS
----------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.quiz_attempts (

    id UUID PRIMARY KEY DEFAULT gen_random_uuid(),

    quiz_id UUID NOT NULL
        REFERENCES public.quizzes(id)
        ON DELETE CASCADE,

    user_id UUID NOT NULL
        REFERENCES public.profiles(id)
        ON DELETE CASCADE,

    score INTEGER NOT NULL DEFAULT 0
        CHECK (score BETWEEN 0 AND 100),

    total_questions INTEGER NOT NULL DEFAULT 0,

    correct_answers INTEGER NOT NULL DEFAULT 0,

    time_taken_minutes INTEGER,

    confidence_before INTEGER
        CHECK (confidence_before BETWEEN 0 AND 100),

    confidence_after INTEGER
        CHECK (confidence_after BETWEEN 0 AND 100),

    answers JSONB NOT NULL DEFAULT '[]',

    completed_at TIMESTAMPTZ,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()

);

----------------------------------------------------------
-- UPDATED_AT TRIGGERS
----------------------------------------------------------

CREATE TRIGGER quizzes_updated_at
BEFORE UPDATE ON public.quizzes
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER questions_updated_at
BEFORE UPDATE ON public.questions
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

CREATE TRIGGER quiz_attempts_updated_at
BEFORE UPDATE ON public.quiz_attempts
FOR EACH ROW EXECUTE FUNCTION public.set_updated_at();

----------------------------------------------------------
-- INDEXES
----------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_quizzes_concept_id
ON public.quizzes(concept_id);

CREATE INDEX IF NOT EXISTS idx_quizzes_status
ON public.quizzes(status);

CREATE INDEX IF NOT EXISTS idx_quizzes_difficulty
ON public.quizzes(difficulty);

CREATE INDEX IF NOT EXISTS idx_questions_quiz_id
ON public.questions(quiz_id);

CREATE INDEX IF NOT EXISTS idx_questions_concept_id
ON public.questions(concept_id);

CREATE INDEX IF NOT EXISTS idx_questions_order
ON public.questions(quiz_id, order_index);

CREATE INDEX IF NOT EXISTS idx_quiz_attempts_user_id
ON public.quiz_attempts(user_id);

CREATE INDEX IF NOT EXISTS idx_quiz_attempts_quiz_id
ON public.quiz_attempts(quiz_id);

CREATE INDEX IF NOT EXISTS idx_quiz_attempts_user_recent
ON public.quiz_attempts(user_id, created_at DESC);

----------------------------------------------------------
-- ENABLE RLS
----------------------------------------------------------

ALTER TABLE public.quizzes        ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.questions      ENABLE ROW LEVEL SECURITY;
ALTER TABLE public.quiz_attempts  ENABLE ROW LEVEL SECURITY;

----------------------------------------------------------
-- RLS POLICIES
----------------------------------------------------------

CREATE POLICY "Authenticated users can read published quizzes"
ON public.quizzes
FOR SELECT
TO authenticated
USING (status = 'published');

CREATE POLICY "Authenticated users can read questions"
ON public.questions
FOR SELECT
TO authenticated
USING (true);

CREATE POLICY "Users can manage own attempts"
ON public.quiz_attempts
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
SQLEOF