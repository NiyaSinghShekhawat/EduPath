Never use JavaScript.

Only TypeScript.

Always use App Router.

Never use Pages Router.

Never use CSS Modules.

Only Tailwind.

Never fetch directly inside components.

Always use Services.

Use Feature First Architecture.

Use Server Actions whenever possible.

No any types.

No duplicated types.

Shared interfaces go inside packages/types.

Never bypass authentication.

Never expose service keys.

## Database Rules

Use the Supabase Dashboard SQL Editor as the primary database management tool.

Every SQL change must exist inside:

supabase/sql/

Do not make schema changes only through the dashboard.

Every dashboard change must be reflected in a SQL file committed to Git.

Supabase CLI migrations are optional.