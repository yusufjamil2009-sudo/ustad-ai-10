# GitHub Integration for USTAD AI

A real, working GitHub connection — no mock, no fake buttons. Each user connects their own GitHub account; USTAD AI can then read and write files in the repositories that user picks.

Nothing existing changes: Guest ID, Backup ID, chat, coins, shop, events, tournaments, Crorepati, certificates, notifications, profile, settings — all untouched. GitHub is added alongside them.

## How the connection works

1. In Settings → Preferences you tap **Connect GitHub**.
2. USTAD AI sends you to GitHub's own authorization page (official flow, no passwords, no tokens pasted by hand).
3. GitHub sends you back to USTAD AI, and the server — never the browser — exchanges the code for an access token.
4. The token is encrypted with the app's existing encryption secret and saved against your Guest ID. It is never sent to the browser, never stored in the browser, never logged.
5. You pick a repository (or create a new one), and from then on USTAD AI works inside that repository as you.

Disconnect deletes the stored token and repository selection. Reconnect simply runs the flow again. If GitHub expires or revokes the token, the app shows "GitHub authorization expired — reconnect" instead of a raw error.

## What you will be able to do

- See connection status and your GitHub username
- Browse and search your repositories, with public/private labels
- Select a working repository and branch
- Create a new repository (name, description, public/private, optional README)
- Browse folders, read files
- Create, edit, delete files; commit and push
- Read and create branches
- Watch a live activity panel: connected → repository selected → reading → planning → editing → committing → pushing → done, with the real file counts and commit link (driven by actual backend results, not a timer)

## Technical section

**Backend (new files)**
- `src/lib/github/oauth.server.ts` — authorization URL with signed `state` (CSRF), code exchange, refresh-token handling, token encrypt/decrypt via existing `crypto.server.ts`.
- `src/lib/github/api.server.ts` — typed GitHub REST client: `getRepositories`, `getRepository`, `getBranches`, `getTree`, `getFile`, `createFile`, `updateFile`, `deleteFile`, `createBranch`, `createCommit`, `pushChanges`, `createRepository`. Central error mapper (401/403/404/409/422/rate-limit → human messages), rate-limit headers surfaced, no aggressive retries.
- `src/lib/github/store.server.ts` — connection + repo-selection persistence keyed by guest id.
- `src/lib/github.functions.ts` — `createServerFn` boundary (all guarded by `requireGuest(token)`, same convention as wallet/identity).
- `src/routes/api/public/github/callback.ts` — the OAuth callback: validates signed state, exchanges the code, stores the encrypted token, redirects back to Settings with a status flag. Handles "user cancelled" and "access denied" cleanly.

**Frontend (new/changed)**
- New `src/components/github/GithubCard.tsx`, `RepoPicker.tsx`, `CreateRepoDialog.tsx`, `GithubActivity.tsx` — premium glass style matching the app, mobile-first (360–430px checked).
- `src/routes/settings.tsx` — one new section rendered next to the existing PWA card. No other change.

**Database (new migration)**
- `github_connections` — guest_id (unique), github_login, github_user_id, encrypted access token + refresh token, scopes, expiry, timestamps.
- `github_repo_selections` — guest_id, repo full name, repo id, default branch, private flag.
- `github_activity` — per-operation progress rows so the activity panel reflects real backend work.
- All three: RLS enabled, `GRANT` to `service_role` only. Tokens are only ever read inside server functions.

**Secrets required** (I will request them through the secure form after you approve): `GITHUB_CLIENT_ID`, `GITHUB_CLIENT_SECRET`. `GITHUB_APP_ID` / `GITHUB_PRIVATE_KEY` are only needed if we later add installation-level automation; the user-authorization flow above does not need them, so I will not request them.

**Callback URL to enter in GitHub** (production):
`https://ustad-ai-10.lovable.app/api/public/github/callback`
Local development: `http://localhost:8080/api/public/github/callback`

**Webhook:** not required for this integration — every operation is user-initiated and reads live from GitHub. I will not add one.

**GitHub App permissions:** Administration read & write (repo creation), Contents read & write, Metadata read-only, Workflows read & write. Nothing else.

## After implementation

I will run typecheck, tests, and a live browser pass of the Settings UI, and hand you a report: files changed, exact URLs, exact GitHub App settings to enter, and how to test each step. The full connect → list → read → write → commit → push round-trip can only be confirmed once your GitHub App credentials are saved.
