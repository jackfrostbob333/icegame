# crouched.mcfunction - Called when player is sneaking/crouching
# Allows player to descend by clearing space and placing ice below

# Clear a 3x3x3 cube around each player to create empty space
# Replaces everything except bedrock using individual setblock commands
execute as @a at @s unless block ~-1 ~-1 ~-1 bedrock run setblock ~-1 ~-1 ~-1 air
execute as @a at @s unless block ~0 ~-1 ~-1 bedrock run setblock ~0 ~-1 ~-1 air
execute as @a at @s unless block ~1 ~-1 ~-1 bedrock run setblock ~1 ~-1 ~-1 air
execute as @a at @s unless block ~-1 ~-1 ~0 bedrock run setblock ~-1 ~-1 ~0 air
execute as @a at @s unless block ~0 ~-1 ~0 bedrock run setblock ~0 ~-1 ~0 air
execute as @a at @s unless block ~1 ~-1 ~0 bedrock run setblock ~1 ~-1 ~0 air
execute as @a at @s unless block ~-1 ~-1 ~1 bedrock run setblock ~-1 ~-1 ~1 air
execute as @a at @s unless block ~0 ~-1 ~1 bedrock run setblock ~0 ~-1 ~1 air
execute as @a at @s unless block ~1 ~-1 ~1 bedrock run setblock ~1 ~-1 ~1 air
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~1 ~1 air replace #minecraft:replaceable
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~1 ~1 air replace water
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~1 ~1 air replace lava

# Place a 3x3 sheet of blue ice two blocks below the player
# Replaces everything except bedrock
execute as @a at @s unless block ~-1 ~-2 ~-1 bedrock run setblock ~-1 ~-2 ~-1 blue_ice
execute as @a at @s unless block ~0 ~-2 ~-1 bedrock run setblock ~0 ~-2 ~-1 blue_ice
execute as @a at @s unless block ~1 ~-2 ~-1 bedrock run setblock ~1 ~-2 ~-1 blue_ice
execute as @a at @s unless block ~-1 ~-2 ~0 bedrock run setblock ~-1 ~-2 ~0 blue_ice
execute as @a at @s unless block ~0 ~-2 ~0 bedrock run setblock ~0 ~-2 ~0 blue_ice
execute as @a at @s unless block ~1 ~-2 ~0 bedrock run setblock ~1 ~-2 ~0 blue_ice
execute as @a at @s unless block ~-1 ~-2 ~1 bedrock run setblock ~-1 ~-2 ~1 blue_ice
execute as @a at @s unless block ~0 ~-2 ~1 bedrock run setblock ~0 ~-2 ~1 blue_ice
execute as @a at @s unless block ~1 ~-2 ~1 bedrock run setblock ~1 ~-2 ~1 blue_ice

# Teleport the player down by 0.5 blocks for smooth descent
# Only teleport if above Y=-63 to prevent falling out of the world
execute as @a at @s if entity @s[y=-60,dy=400] run tp @s ~ ~-0.5 ~
