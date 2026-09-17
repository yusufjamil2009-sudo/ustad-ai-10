import { useEffect } from "react";

export type ChatDeliveryPhase =
  | "idle"
  | "thinking-enter"
  | "thinking-active"
  | "thinking-exit"
  | "delivery-enter"
  | "card-present"
  | "card-kick"
  | "card-flight"
  | "delivery-exit";

function Person({ carrying = false }: { carrying?: boolean }) {
  return (
    <div className="nx-chat-person" aria-hidden="true">
      <span className="nx-chat-person-head" />
      <span className="nx-chat-person-neck" />
      <span className="nx-chat-person-body" />
      <span className="nx-chat-person-arm arm-back" />
      <span className="nx-chat-person-arm arm-front" />
      <span className="nx-chat-person-leg leg-back" />
      <span className="nx-chat-person-leg leg-front" />
      {carrying ? <span className="nx-chat-carried-card" /> : null}
    </div>
  );
}

export function ChatDeliveryLayer({
  phase,
  onAdvance,
}: {
  phase: ChatDeliveryPhase;
  onAdvance: () => void;
}) {
  useEffect(() => {
    if (phase === "idle" || phase === "thinking-active") return;
    const durations: Partial<Record<ChatDeliveryPhase, number>> = {
      "thinking-enter": 850,
      "thinking-exit": 700,
      "delivery-enter": 1050,
      "card-present": 650,
      "card-kick": 560,
      "card-flight": 900,
      "delivery-exit": 760,
    };
    const id = window.setTimeout(onAdvance, (durations[phase] ?? 900) + 180);
    return () => window.clearTimeout(id);
  }, [onAdvance, phase]);

  if (phase === "idle") return null;
  const thinking = phase.startsWith("thinking");

  return (
    <div className="nx-chat-cinema" data-phase={phase} aria-hidden="true">
      <div
        className={thinking ? "nx-chat-thinking-actor" : "nx-chat-delivery-actor"}
        onAnimationEnd={(event) => {
          if (event.target === event.currentTarget) onAdvance();
        }}
      >
        <Person carrying={!thinking && phase === "delivery-enter"} />
        {!thinking ? <span className="nx-chat-contact-shadow" /> : null}
      </div>
    </div>
  );
}