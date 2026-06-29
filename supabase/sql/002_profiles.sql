-- ============================================================
-- EduPath Database
-- File: 002_profiles.sql
-- Description:
-- Creates the user profiles table.
-- Depends on: 001_enums.sql
-- ============================================================

---------------------------------------------------------------
-- EXTENSIONS
---------------------------------------------------------------

CREATE EXTENSION IF NOT EXISTS "pgcrypto";

---------------------------------------------------------------
-- PROFILES
---------------------------------------------------------------

CREATE TABLE IF NOT EXISTS public.profiles (

    id UUID PRIMARY KEY
        REFERENCES auth.users(id)
        ON DELETE CASCADE,

    email TEXT UNIQUE NOT NULL,

    full_name TEXT,

    username TEXT UNIQUE,

    avatar_url TEXT,

    bio TEXT,

    role user_role NOT NULL DEFAULT 'student',

    xp INTEGER NOT NULL DEFAULT 0,

    level INTEGER NOT NULL DEFAULT 1,

    streak INTEGER NOT NULL DEFAULT 0,

    total_study_minutes INTEGER NOT NULL DEFAULT 0,

    onboarding_completed BOOLEAN NOT NULL DEFAULT FALSE,

    preferred_difficulty difficulty_level
        DEFAULT 'beginner',

    timezone TEXT DEFAULT 'UTC',

    is_active BOOLEAN NOT NULL DEFAULT TRUE,

    created_at TIMESTAMPTZ NOT NULL DEFAULT NOW(),

    updated_at TIMESTAMPTZ NOT NULL DEFAULT NOW()
);

---------------------------------------------------------------
-- UPDATED_AT FUNCTION
---------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.set_updated_at()
RETURNS TRIGGER
LANGUAGE plpgsql
AS $$
BEGIN
    NEW.updated_at = NOW();
    RETURN NEW;
END;
$$;

---------------------------------------------------------------
-- UPDATED_AT TRIGGER
---------------------------------------------------------------

DROP TRIGGER IF EXISTS profiles_set_updated_at
ON public.profiles;

CREATE TRIGGER profiles_set_updated_at
BEFORE UPDATE
ON public.profiles
FOR EACH ROW
EXECUTE FUNCTION public.set_updated_at();

---------------------------------------------------------------
-- AUTO CREATE PROFILE
---------------------------------------------------------------

CREATE OR REPLACE FUNCTION public.handle_new_user()
RETURNS TRIGGER
LANGUAGE plpgsql
SECURITY DEFINER
SET search_path = public
AS $$
BEGIN

INSERT INTO public.profiles (

    id,
    email,
    full_name,
    avatar_url

)

VALUES (

    NEW.id,

    NEW.email,

    COALESCE(
        NEW.raw_user_meta_data->>'full_name',
        ''
    ),

    NEW.raw_user_meta_data->>'avatar_url'

)

ON CONFLICT (id) DO NOTHING;

RETURN NEW;

END;
$$;

---------------------------------------------------------------
-- AUTH TRIGGER
---------------------------------------------------------------

DROP TRIGGER IF EXISTS on_auth_user_created
ON auth.users;

CREATE TRIGGER on_auth_user_created

AFTER INSERT
ON auth.users

FOR EACH ROW

EXECUTE FUNCTION public.handle_new_user();

---------------------------------------------------------------
-- INDEXES
---------------------------------------------------------------

CREATE INDEX IF NOT EXISTS idx_profiles_username
ON public.profiles(username);

CREATE INDEX IF NOT EXISTS idx_profiles_role
ON public.profiles(role);

CREATE INDEX IF NOT EXISTS idx_profiles_level
ON public.profiles(level);

CREATE INDEX IF NOT EXISTS idx_profiles_active
ON public.profiles(is_active);

---------------------------------------------------------------
-- ENABLE RLS
---------------------------------------------------------------

ALTER TABLE public.profiles
ENABLE ROW LEVEL SECURITY;

---------------------------------------------------------------
-- TEMP DEV POLICIES
---------------------------------------------------------------

CREATE POLICY "Users can read own profile"

ON public.profiles

FOR SELECT

USING (auth.uid() = id);

CREATE POLICY "Users can update own profile"

ON public.profiles

FOR UPDATE

USING (auth.uid() = id);

---------------------------------------------------------------
-- VERIFY
---------------------------------------------------------------

SELECT *

FROM public.profiles
LIMIT 5;