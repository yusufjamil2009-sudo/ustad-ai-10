# NEW USTAD AI chat response delivery animation

## Scope
Upgrade only the existing `/app` chat while NEW USTAD AI mode is active. Classic chat, routes, AI calls, history, authentication, settings, database, and response actions remain unchanged.

## Experience
- Render each real sent user message in a restrained frosted-glass message card in NEW USTAD AI mode.
- Replace the three-dot waiting indicator only in NEW USTAD AI mode with a slim professional 2.5D character entering from the right and performing a subtle working pose.
- Keep that character active for the exact lifetime of the existing real `busy` request; no timer will decide when the answer is ready.
- After the real response arrives, walk the thinking character out, bring a second delivery character from the left, present the actual response card, perform one controlled object kick, and fly/settle that same rendered response card into its normal message position.
- Size the final card naturally from its real content, constrained to the chat viewport; long answers keep normal page scrolling and all current action controls.
- Keep the chat background, header, history, composer, camera, and routes fixed throughout.

## Implementation
- Add a small presentation-only state machine associated with the newly completed assistant message ID. The existing send function remains the sole source of messages and completion.
- Add a Chat-scoped visual layer with non-interactive CSS characters. Advance visual-only phases through animation completion events, with a short safety fallback that can only reveal the already-received answer.
- Reuse the existing assistant message DOM and `MessageActions`; only its wrapper receives delivery/settle states. No duplicate message or second AI request is created.
- Keep Classic mode’s current indicator and message appearance exactly as-is.
- Add reduced-motion behavior that reveals the real response immediately and mobile constraints for 360–430px widths.

## Validation
- Confirm one send creates one user message and one real assistant response.
- Confirm the character waits for real request completion, no three-dot indicator appears in NEW mode, and the actual response/actions remain interactive after settling.
- Confirm Classic mode is unchanged.
- Check 360, 375, 390, 412, 430, tablet, and desktop widths for overflow, clipping, blocked controls, and fixed viewport behavior.
- Confirm build, runtime, console, and network signals remain clean.
