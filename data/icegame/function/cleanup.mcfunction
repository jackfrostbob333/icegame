# cleanup.mcfunction - Toggle the clearout function on/off
# Call with: /function icegame:cleanup
# This controls whether ice is continuously removed around players
# Ice placing and ice removal are mutually exclusive

#declare objective toggleFlag
#declare objective placeToggle

# Toggle logic: if 0 → 1 (enable), if 1 → 0 (disable)
# Uses temporary value (2) to prevent both conditions from executing in same tick
execute as @a if score @s toggleFlag matches 0 run scoreboard players set @s toggleFlag 2
execute as @a if score @s toggleFlag matches 1 run scoreboard players set @s toggleFlag 0
execute as @a if score @s toggleFlag matches 2 run scoreboard players set @s toggleFlag 1

# If ice removal is enabled, force ice placing to be disabled
execute as @a if score @s toggleFlag matches 1 run scoreboard players set @s placeToggle 0

# Tell players the current state of both toggles
execute as @a if score @s toggleFlag matches 1 run tellraw @s [{"text":"[IceGame] ","color":"aqua"},{"text":"Ice placing: ","color":"white"},{"text":"DISABLED","color":"red"},{"text":" | Ice removal: ","color":"white"},{"text":"ENABLED","color":"green"}]
execute as @a if score @s toggleFlag matches 0 run tellraw @s [{"text":"[IceGame] ","color":"aqua"},{"text":"Ice placing: ","color":"white"},{"text":"DISABLED","color":"red"},{"text":" | Ice removal: ","color":"white"},{"text":"DISABLED","color":"red"}]

