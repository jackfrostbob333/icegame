# Update sidebar display
function icegame:update_sidebar

# Remove water created by melting frosted ice
execute if score Global iceType matches 0 run function icegame:remove_water

# Update player team based on held items (shows colored prefix in player list)
execute as @a[predicate=icegame:holding_sword] run team join icegame_playing @s
execute as @a[predicate=icegame:holding_shovel] run team join icegame_cleaning @s
execute as @a[predicate=!icegame:holding_sword,predicate=!icegame:holding_shovel] run team join icegame_none @s

# Detect players who START placing ice (holding sword, wasn't active before)
execute as @a[predicate=icegame:holding_sword,scores={iceActive=0}] run title @s times 5 20 5
execute as @a[predicate=icegame:holding_sword,scores={iceActive=0}] run title @s title {"text":"Ice Placing","color":"aqua","bold":true}
execute as @a[predicate=icegame:holding_sword,scores={iceActive=0}] run title @s subtitle {"text":"Activated","color":"white"}
execute as @a[predicate=icegame:holding_sword,scores={iceActive=0}] run scoreboard players set @s iceActive 1

# Detect players who STOP placing ice (not holding sword, was active before)
execute as @a[predicate=!icegame:holding_sword,scores={iceActive=1}] run scoreboard players set @s iceActive 0

# Ice placing works per-player - check if THIS player is holding a sword
# Run placeblocks for players who are holding swords and NOT sneaking
execute as @a[predicate=icegame:holding_sword] at @s unless predicate icegame:sneaking run function icegame:placeblocks

# If THIS player is holding a sword AND sneaking, schedule the crouched function
execute as @a[predicate=icegame:holding_sword] at @s if predicate icegame:sneaking run schedule function icegame:crouched 1t

# Detect cleanup mode activation (all players holding shovels, wasn't active)
execute if entity @a unless entity @a[predicate=!icegame:holding_shovel] if score Global cleanupActive matches 0 run title @a times 2 10 2
execute if entity @a unless entity @a[predicate=!icegame:holding_shovel] if score Global cleanupActive matches 0 run title @a title {"text":"Cleanup Mode","color":"yellow","bold":true}
execute if entity @a unless entity @a[predicate=!icegame:holding_shovel] if score Global cleanupActive matches 0 run title @a subtitle {"text":"Activated","color":"white"}
execute if entity @a unless entity @a[predicate=!icegame:holding_shovel] if score Global cleanupActive matches 0 run scoreboard players set Global cleanupActive 1

# Detect cleanup mode deactivation (not all players holding shovels, was active)
execute unless entity @a if score Global cleanupActive matches 1 run scoreboard players set Global cleanupActive 0
execute if entity @a[predicate=!icegame:holding_shovel] if score Global cleanupActive matches 1 run scoreboard players set Global cleanupActive 0

# Decrease cooldown timer for all players
scoreboard players remove @a[scores={cleanupCooldown=1..}] cleanupCooldown 1

# Ice removal - each player holding a shovel clears ice around themselves
# Only run if cooldown is 0 or not set, then set cooldown to prevent spam (10 ticks = 0.5 seconds)
execute as @a[predicate=icegame:holding_shovel] unless score @s cleanupCooldown matches 1.. at @s run function icegame:clearout
execute as @a[predicate=icegame:holding_shovel] unless score @s cleanupCooldown matches 1.. run scoreboard players set @s cleanupCooldown 10