# Cinematic Guest ID Flow Fix

## Goal
Preserve the existing backend, Guest ID, session, and Chat systems while making the opening sequence one continuous experience with no premature Chat render.

## Changes
- Replace the separate cinematic placeholder card and later Guest ID wrapper with one persistent glass-card container that begins inside the suitcase and expands into the existing interactive Guest ID screen.
- Tighten the suitcase timeline so the lid opening and card rise overlap, removing the long pause without using authentication timers.
- Add an explicit client-side verification presentation state: `verifying` starts on submit, `verified` starts only after the existing server/session verification succeeds, and Chat remains unmounted until the success animation finishes.
- Centralize the final handoff in the app shell so only one callback unlocks and mounts Chat after session readiness plus animation completion.
- Keep the hero hidden throughout the transition, preserve New Guest ID and Backup ID behavior, and add narrow-screen safeguards for 360–430px widths.
- Refresh both requested runtime secrets with new secure values.

## Validation
- Test new Guest ID and Backup ID paths in the browser.
- Confirm no blank frame, duplicate card, hero flash, or Chat flash.
- Check 360, 375, 390, 412, and 430px widths for clipping and horizontal overflow.
- Confirm current build, runtime, console, and network signals remain clean.

## Technical Notes
- Presentation transitions use CSS transforms and opacity only.
- Existing authentication, database calls, session adoption, Chat logic, routes, and business rules remain unchanged.
