# Global Agent Rules

## Goal

Prefer simple, maintainable solutions. Minimize dependencies and complexity. complexity is very very bad

## Before Coding

- **say no first**: the best feature is a feature not built. the best abstraction is an abstraction not added.
- **simple > clever**: clever code is a complexity demon in disguise.
- **complexity is apex predator**: once it enters codebase, very hard remove. 
Before introducing a new pattern or dependency, check if an existing one already solves the problem.

## Code Style

break complex expressions into named variables — easier debug, easier understand:

bad:
```js
if(contact && !contact.isActive() && (contact.inGroup(FAMILY) || contact.inGroup(FRIENDS)))
```

good:
```js
const inactive = !contact.isActive();
const isFamilyOrFriends = contact.inGroup(FAMILY) || contact.inGroup(FRIENDS);
if(contact && inactive && isFamilyOrFriends)
```

## Changes

Make the smallest change that solves the problem.
Do not modify lines outside the scope of the task, including formatting and imports.
Do not perform unrelated refactoring unless explicitly requested.
Do not introduce new dependencies without asking for configuration.

## Verification

Run relevant tests, linters, or builds when possible.
State what was verified and what could not be verified.
If a command fails, stop and report the error rather than working around it.

## Uncertainty

If requirements are ambiguous, ask.
Do not invent APIs, configuration values, or file paths.

## Communication
Keep explanations short. Lead with what changed and why; skip obvious implementation details.
Focus on trade-offs and risks rather than implementation details.
