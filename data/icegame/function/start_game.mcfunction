# start_game.mcfunction - Toggle ice placing on/off for all players
# Call with: /function icegame:start_game
# This enables/disables the placeblocks and crouched functions
# Ice placing and ice removal are mutually exclusive

#declare objective placeToggle
#declare objective toggleFlag

# Toggle logic: if 0 → 1 (enable ice placing), if 1 → 0 (disable ice placing)
# Uses temporary value (2) to prevent both conditions from executing in same tick
execute as @a if score @s placeToggle matches 0 run scoreboard players set @s placeToggle 2
execute as @a if score @s placeToggle matches 1 run scoreboard players set @s placeToggle 0
execute as @a if score @s placeToggle matches 2 run scoreboard players set @s placeToggle 1

# If ice placing is enabled, force ice removal to be disabled
execute as @a if score @s placeToggle matches 1 run scoreboard players set @s toggleFlag 0

# Tell players the current state of both toggles
execute as @a if score @s placeToggle matches 1 run tellraw @s [{"text":"[IceGame] ","color":"aqua"},{"text":"Ice placing: ","color":"white"},{"text":"ENABLED","color":"green"},{"text":" | Ice removal: ","color":"white"},{"text":"DISABLED","color":"red"}]
execute as @a if score @s placeToggle matches 0 run tellraw @s [{"text":"[IceGame] ","color":"aqua"},{"text":"Ice placing: ","color":"white"},{"text":"DISABLED","color":"red"},{"text":" | Ice removal: ","color":"white"},{"text":"DISABLED","color":"red"}]
