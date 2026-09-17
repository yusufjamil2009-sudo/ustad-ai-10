# Suitcase to Guest ID card transition

## Scope
Fix only the visual handoff between the opened suitcase and the existing Guest ID interface. Preserve every earlier cinematic beat, Guest ID behavior, verification, navigation, and Chat behavior.

## Implementation
- Keep the real existing Guest ID screen mounted inside one persistent glass-card container during the emergence.
- Start that container compact and aligned inside the suitcase, with its lower portion naturally hidden by a foreground suitcase edge.
- Animate the same container upward, gently enlarge it, and settle it into the final Guest ID position using transforms and opacity only.
- Reveal the existing card contents progressively during the rise without creating a duplicate or fake form.
- Keep the suitcase opening and card rise overlapped with no artificial pause.

## Validation
- Verify the transition visually from the home button through the interactive Guest ID screen.
- Check 360, 375, 390, 412, and 430px widths for clipping and horizontal overflow.
- Confirm one card only, no hero flash, no Chat flash, and no console or build errors.

## Technical details
The cinematic overlay will host the existing Guest ID children during the final phase so the outer card DOM remains continuous. The existing session, authentication, database, verification, and Chat code paths remain unchanged.
