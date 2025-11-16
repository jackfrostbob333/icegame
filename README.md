# IceGame Datapack

A Minecraft datapack that allows players to create platforms of blue ice as they move, enabling fast travel across the world.

## Installation

1. Copy the `icegame` folder into your world's `datapacks` directory
2. Run `/reload` in-game
3. The datapack will automatically set up when the world loads

## How It Works

This datapack creates blue ice platforms under players as they walk and allows them to descend by crouching. It uses two mutually exclusive toggle systems - only one mode can be active at a time.

## Commands

### `/function icegame:start_game`
Toggles ice placing mode on/off for all players. When enabled:
- Walking creates a 3x3 platform of blue ice under your feet
- Crouching clears space around you and places ice below, allowing descent (stops at Y=-63 to prevent void death)
- **Automatically disables ice removal mode** (the two modes are mutually exclusive)
- Replaces all blocks except bedrock
- Shows status of both toggles in chat

### `/function icegame:cleanup`
Toggles ice removal mode on/off for all players. When enabled:
- Continuously removes all ice blocks (normal ice, packed ice, and blue ice) in a 16x16x16 area around each player
- **Automatically disables ice placing mode** (the two modes are mutually exclusive)
- Useful for cleaning up ice trails or resetting areas
- Shows status of both toggles in chat

## Functions Explained

### Player Movement Functions
- **placeblocks** - Runs when walking (not sneaking). Clears a 3x3x4 space and places a 3x3 blue ice sheet under the player. Replaces all blocks except bedrock using individual setblock commands.
- **crouched** - Runs when sneaking/crouching. Clears a 3x3x3 space, places ice 2 blocks below, and teleports player down 0.5 blocks for smooth descent. Only teleports if above Y=-63 to prevent falling into the void. Replaces all blocks except bedrock.

### Control Functions
- **start_game** - Toggles the `placeToggle` scoreboard (0 = disabled, 1 = enabled) to control ice placing. Automatically sets `toggleFlag` to 0 when enabled. Shows both toggle states in chat.
- **cleanup** - Toggles the `toggleFlag` scoreboard (0 = disabled, 1 = enabled) to control ice removal. Automatically sets `placeToggle` to 0 when enabled. Shows both toggle states in chat.
- **clearout** - Removes all ice types in a 16x16x16 cube around the nearest player (runs continuously when toggleFlag = 1)

### Setup Functions
- **setup** - Runs automatically on datapack load. Creates scoreboard objectives and initializes player values to 0
- **tick** - Runs every game tick (20 times per second). Checks player state and calls appropriate functions

## Scoreboard Objectives

- **placeToggle** - Controls ice placing (0 = off, 1 = on)
- **toggleFlag** - Controls ice removal (0 = off, 1 = on)

## Tips

- Blue ice is the fastest ice type in Minecraft and allows extremely fast movement with boats or when running
- Use `/function icegame:cleanup` when ice trails become too messy
- Both toggles start disabled (0) when players join - use the functions to enable them
- **Ice placing and ice removal are mutually exclusive** - enabling one automatically disables the other
- The datapack works per-player, so each player can have different toggle states
- Bedrock is protected - the datapack will not destroy or replace bedrock blocks
- Crouching descent stops at Y=-63 to prevent falling into the void

## Technical Details

- Uses predicates to detect player sneaking state
- Scheduled functions (1 tick delay) for crouching to ensure smooth execution
- Scoreboard-based toggle system prevents conflicts when multiple players use commands simultaneously
- Ice placing and ice removal modes are mutually exclusive - enabling one disables the other
- Individual setblock commands with bedrock checks ensure bedrock is never replaced
- Y-level check (Y >= -60) prevents players from teleporting into the void when descending
- Chat feedback shows status of both toggles whenever either function is called

## Compatibility

- Requires Minecraft version with pack_format 12 or adjust `pack.mcmeta`
- Works in both single-player and multiplayer
- Should be compatible with most other datapacks
