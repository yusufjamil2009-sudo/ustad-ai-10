# Preferences NEW USTAD AI cinematic

## Scope
Change only Settings → Preferences → NEW USTAD AI → OPEN NEW USTAD AI. Leave the landing page, normal Chat, authentication, Guest ID, sessions, navigation, backend, and every other feature unchanged.

## Implementation
- Intercept the existing Preferences button instead of navigating immediately.
- Play the existing lightweight cinematic as a full-screen overlay from that exact button.
- After the cinematic finishes or is skipped, enable the existing NEW USTAD AI mode and navigate once to the existing `/next` screen.
- Prevent repeated clicks while the sequence is active and preserve the current fallback/reduced-motion behavior.

## Validation
- Confirm the Preferences button launches the cinematic and reaches NEW USTAD AI once.
- Confirm unrelated entry buttons and existing systems are untouched.
- Check mobile widths from 360–430px and verify no runtime, console, or build errors.
