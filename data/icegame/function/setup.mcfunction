# setup.mcfunction - Runs once when the datapack loads
# Creates scoreboard objectives and initializes player values

# toggleFlag: Controls the clearout function (removes ice in 16x16x16 area)
# 0 = clearout disabled, 1 = clearout enabled
scoreboard objectives add toggleFlag dummy
scoreboard players set @p toggleFlag 0

# placeToggle: Controls ice placing functions (placeblocks and crouched)
# 0 = ice placing disabled, 1 = ice placing enabled
scoreboard objectives add placeToggle dummy
scoreboard players set @p placeToggle 0

# iceActive: Tracks if each player is actively placing ice (1 = placing, 0 = not placing)
scoreboard objectives add iceActive dummy
scoreboard players set @a iceActive 0

# cleanupActive: Tracks if cleanup mode is active (1 = active, 0 = inactive)
scoreboard objectives add cleanupActive dummy
scoreboard players set Global cleanupActive 0

# cleanupCooldown: Cooldown timer for clearout function to prevent command overflow
scoreboard objectives add cleanupCooldown dummy

# iceType: Stores which ice type to place (0=frosted_ice, 1=ice, 2=packed_ice, 3=blue_ice)
scoreboard objectives add iceType dummy
scoreboard players set Global iceType 0

# sidebar: Display player count by mode on the right side of screen
scoreboard objectives add sidebar dummy "§lIce Game Status"
scoreboard objectives setdisplay sidebar sidebar

# Create teams for visual display with colored prefixes
team add icegame_none "No Mode"
team modify icegame_none prefix {"text":"[IDLE] ","color":"gray"}

team add icegame_playing "Playing"
team modify icegame_playing prefix {"text":"[PLAYING] ","color":"aqua"}

team add icegame_cleaning "Cleaning"
team modify icegame_cleaning prefix {"text":"[CLEANING] ","color":"yellow"}

# Add all players to idle team by default
team join icegame_none @a

