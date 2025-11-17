# IceGame Datapack

A Minecraft datapack that places temporary ice under players to enable fast movement and provides a per-player cleanup mode.

## Installation

1. Copy the `icegame` folder into your world's `datapacks` directory.
2. Run `/reload` in-game.
3. The datapack's `setup` function runs automatically on load and prepares scoreboards/teams.

## Activation (current behavior)

This datapack uses item-based activation (per-player):
- **Hold any sword** → Ice placing mode (places ice while you walk).
- **Hold any shovel** → Cleanup mode (removes nearby ice).

Activation is per-player (each player can be in a different mode simultaneously). Legacy toggle objectives (`placeToggle`, `toggleFlag`) are still created for compatibility but are not required for normal use.

## Commands / Quick controls

- `/function icegame:set_ice_frosted` — switch to frosted ice (melts away)
- `/function icegame:set_ice_regular` — switch to regular ice
- `/function icegame:set_ice_packed` — switch to packed ice
- `/function icegame:set_ice_blue` — switch to blue ice

You can still run `/reload` to reapply `setup` if needed.

## Features & Behavior

### Ice placing (holding a sword)
- Runs per-player while the player is holding any sword and not sneaking.
- Places a 3×3 ice sheet directly under the player's feet (Y = -1).
- Clears a 3×3×3 head/space area (Y = 0..2) to prevent suffocation and to remove water/lava/ice types in that region.
- The placed ice type depends on the global `iceType` scoreboard. Default is **frosted ice**.

### Frosted ice behavior
- Frosted ice is placed with `age=0` so it can naturally age and melt.
- To avoid leaving water when frosted ice melts, the datapack runs `remove_water` (a per-tick cleanup) when frosted mode is active; this replaces nearby water with air so frosted ice effectively disappears instead of turning into water.

### Crouch descent (sneak)
- While holding a sword and sneaking, the `crouched` function clears a 3×3×3 area and places ice two blocks below to allow safe descent, then teleports the player down 0.5 blocks (only if above Y=-63 to prevent void death).

### Cleanup mode (holding a shovel)
- Runs per-player while holding a shovel.
- Removes `blue_ice`, `packed_ice`, and `ice` in multiple smaller regions (center + +X/-X/+Z/-Z chunks) to cover a large area while avoiding command size limits.
- The cleanup runs on a 10-tick cooldown (0.5 seconds) per player to prevent overload.

### Visual UI and feedback
- Titles: players receive short title notifications when they enter ice-placing mode.
- Player list (Tab): players are assigned to colored teams with prefixes: `[IDLE]` (gray), `[PLAYING]` (aqua), `[CLEANING]` (yellow).
- Sidebar: a simple sidebar objective shows counts of players by mode.

### Safety and protections
- Bedrock is never replaced (the code checks `unless block ... bedrock`).
- Crouch descent and teleport avoid Y <= -63 to prevent void deaths.
- The datapack sets `generic.fall_damage_multiplier` to `0` in `setup` to disable fall damage.

## Internals (short)
- Uses predicates in `data/icegame/predicate/` to detect held swords/shovels and sneaking.
- Main loop is `data/icegame/functions/tick.mcfunction` (runs every tick). It updates teams, UI, and calls `placeblocks`, `crouched`, or `clearout` per player.
- `clearout.mcfunction` uses several smaller `fill` commands instead of one giant 16×16×16 fill to stay within command limits.
- `placeblocks.mcfunction` uses `setblock` for the 3×3 sheet and avoids overwriting bedrock or existing frosted ice.

## Scoreboards and persistent values
- `iceActive` — per-player state (0 = idle, 1 = placing, 2 = cleaning in some code paths).
- `cleanupCooldown` — per-player cooldown timer used by cleanup.
- `iceType` — global value selecting which ice to place (0=frosted,1=ice,2=packed,3=blue).
- `cleanupActive`, `toggleFlag`, `placeToggle` — legacy/compatibility objectives still created by `setup` but item/predicate-based activation is the primary mechanism.

## Compatibility
- Pack format: uses pack_format 12 (adjust `pack.mcmeta` if targeting a different game version).
- Works single-player and multiplayer. Designed to play nice with other datapacks by limiting replacements and preserving bedrock.

## Notes & troubleshooting
- If you see chat spam from older debug messages, `/reload` will pick up the current code (recent changes removed most chat spam and use titles instead).
- If frosted ice seems to instantly disappear, ensure `iceType` is set to `0` only when you want the frosted behavior; `remove_water` runs while frosted mode is active and removes water left by melting.
