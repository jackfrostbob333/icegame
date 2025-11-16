# update_sidebar.mcfunction - Updates the sidebar display with player status
# Shows all players and their current mode using dummy players

# Clear old entries (remove dummy players from previous tick)
scoreboard players reset §7[IDLE] sidebar
scoreboard players reset §b[PLAYING] sidebar
scoreboard players reset §e[CLEANING] sidebar

# Show idle players
execute as @a[predicate=!icegame:holding_sword,predicate=!icegame:holding_shovel] run scoreboard players set §7[IDLE] sidebar 0

# Show playing players  
execute as @a[predicate=icegame:holding_sword] run scoreboard players set §b[PLAYING] sidebar 1

# Show cleaning players
execute as @a[predicate=icegame:holding_shovel] run scoreboard players set §e[CLEANING] sidebar 2
