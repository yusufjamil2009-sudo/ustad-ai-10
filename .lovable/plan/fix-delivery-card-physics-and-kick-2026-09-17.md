# Fix delivery card physics and kick

## Scope
- Keep the required character directions unchanged: thinker enters/exits right, courier enters/exits left.
- Keep the existing real AI response card mounted as the single visual object.
- Anchor that card to the courier’s shoulder during entry, with subtle weight, bounce, and contact shadow.
- Move the same card from shoulder to directly in front after the courier stops.
- Hold it still through kick preparation, add one readable foot-contact reaction, then launch it primarily toward the viewer using depth and scale.
- Preserve AI calls, response data, chat history, actions, sizing rules, camera, page design, and all non-animation systems.

## Technical details
- Measure the rendered courier and real response card inside the existing delivery layer, then expose responsive carry/front offsets as CSS variables.
- Reuse the existing delivery phases and timings; update only presentation transforms and character pose styling.
- Retain reduced-motion fallback and viewport-safe response sizing.

## Verification
- Exercise every phase at mobile width and confirm shoulder carry, front placement, one kick, forward flight, final settlement, and left courier exit.
- Confirm the response DOM identity remains unchanged and check build/runtime errors.
