-- ============================================================
-- EduPath Database
-- File: 001_enums.sql
-- Description:
-- Creates all ENUM types used throughout EduPath.
--
-- Run FIRST.
-- ============================================================

---------------------------------------------------------------
-- USER ROLE
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE user_role AS ENUM (
        'student',
        'mentor',
        'admin'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- DIFFICULTY LEVEL
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE difficulty_level AS ENUM (
        'beginner',
        'intermediate',
        'advanced'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- RESOURCE TYPE
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE resource_type AS ENUM (
        'video',
        'article',
        'book',
        'documentation',
        'website',
        'course',
        'notes',
        'pdf',
        'practice',
        'other'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- CONTENT TYPE
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE content_type AS ENUM (
        'lesson',
        'quiz',
        'assignment',
        'project',
        'revision'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- STUDY SESSION STATUS
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE session_status AS ENUM (
        'planned',
        'active',
        'completed',
        'cancelled'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- MEMORY STRENGTH
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE memory_strength AS ENUM (
        'weak',
        'medium',
        'strong',
        'mastered'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- QUIZ STATUS
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE quiz_status AS ENUM (
        'draft',
        'published',
        'archived'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- QUESTION TYPE
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE question_type AS ENUM (
        'mcq',
        'multiple_select',
        'true_false',
        'short_answer',
        'long_answer',
        'coding'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- ACHIEVEMENT CATEGORY
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE achievement_category AS ENUM (
        'learning',
        'streak',
        'quiz',
        'project',
        'revision',
        'community'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- XP EVENT TYPE
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE xp_event_type AS ENUM (
        'lesson_completed',
        'quiz_completed',
        'perfect_quiz',
        'daily_login',
        'study_session',
        'project_submission',
        'achievement',
        'revision'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- CONCEPT MASTERY
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE mastery_level AS ENUM (
        'unknown',
        'learning',
        'understood',
        'proficient',
        'mastered'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- NOTIFICATION TYPE
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE notification_type AS ENUM (
        'reminder',
        'achievement',
        'quiz',
        'system',
        'mentor'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- AI AGENT TYPE
---------------------------------------------------------------

DO $$
BEGIN
    CREATE TYPE ai_agent AS ENUM (
        'planner',
        'teacher',
        'mentor',
        'reviewer',
        'memory',
        'analytics'
    );
EXCEPTION
    WHEN duplicate_object THEN NULL;
END $$;

---------------------------------------------------------------
-- VERIFY
---------------------------------------------------------------

SELECT
    typname
FROM pg_type
WHERE typtype='e'
ORDER BY typname;