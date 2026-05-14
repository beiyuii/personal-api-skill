# Agent Onboarding Test

Use this test when checking whether an AI agent understands the Personal API collaboration model.

The goal is not to grade writing style. The goal is to verify that the agent can route work, respect boundaries, and perform closure when needed.

## Self-Test Questions

An agent should answer these correctly before doing strict-mode work:

1. Which files should you read first to understand the user?
2. Can you directly rewrite `ME.md` with guessed identity content?
3. When working under `30.knowledge/`, which operating files should you read?
4. What is the difference between full setup and `--minimal` setup?
5. Where should raw source material enter the knowledge system?
6. Where should compiled literature notes go?
7. What should you do if you learn something reusable but cannot write to a real memory system?
8. What should you check before ending a task?

## Expected Answers

1. Read `ME.md` and `AGENT.md` first when personalized context matters.
2. No. Core identity is human-owned; ask the user for real answers.
3. Read `30.knowledge/00.system/ai-agent-operating-guide.md` and `30.knowledge/00.system/methodology.md`.
4. Full setup creates the full `30.knowledge/` Knowledge Palace v2 system. `--minimal` creates only the identity layer and basic navigation.
5. Raw material enters `30.knowledge/10.capture/`.
6. Compiled literature notes go to `30.knowledge/40.notes/literature/`.
7. Output a `Memory candidate` instead of claiming it was remembered.
8. Check project status, Obsidian outputs, memory candidates, SOP updates, and next actions.

## Pass Criteria

The agent passes when it:

- keeps Track A identity files protected;
- routes `30.knowledge/` work through the methodology;
- distinguishes light, standard, and strict modes;
- does not overclaim memory persistence;
- can explain task closure without being reminded.
