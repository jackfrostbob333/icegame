# placeblocks.mcfunction - Called when player is walking (not sneaking)
# Creates a platform of blue ice under the player for movement

# Clear a 3x3x3 space at player level (feet, chest, head) to prevent suffocation
# Y=0 is feet level, Y=1 is chest/waist, Y=2 is head
# Don't clear frosted ice so it can melt naturally
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~2 ~1 air replace #minecraft:replaceable
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~2 ~1 air replace water
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~2 ~1 air replace lava
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~2 ~1 air replace blue_ice
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~2 ~1 air replace packed_ice
execute as @a at @s run fill ~-1 ~0 ~-1 ~1 ~2 ~1 air replace ice

# Place a 3x3 sheet of ice directly under the player's feet (Y=-1)
# Ice type depends on Global iceType score (0=frosted, 1=ice, 2=packed, 3=blue)
# Replaces everything except bedrock

# Frosted ice (age:0 = lasts longest)
# Only place if the block is not already frosted ice
execute if score Global iceType matches 0 as @a at @s unless block ~-1 ~-1 ~-1 bedrock unless block ~-1 ~-1 ~-1 frosted_ice run setblock ~-1 ~-1 ~-1 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~0 ~-1 ~-1 bedrock unless block ~0 ~-1 ~-1 frosted_ice run setblock ~0 ~-1 ~-1 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~1 ~-1 ~-1 bedrock unless block ~1 ~-1 ~-1 frosted_ice run setblock ~1 ~-1 ~-1 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~-1 ~-1 ~0 bedrock unless block ~-1 ~-1 ~0 frosted_ice run setblock ~-1 ~-1 ~0 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~0 ~-1 ~0 bedrock unless block ~0 ~-1 ~0 frosted_ice run setblock ~0 ~-1 ~0 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~1 ~-1 ~0 bedrock unless block ~1 ~-1 ~0 frosted_ice run setblock ~1 ~-1 ~0 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~-1 ~-1 ~1 bedrock unless block ~-1 ~-1 ~1 frosted_ice run setblock ~-1 ~-1 ~1 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~0 ~-1 ~1 bedrock unless block ~0 ~-1 ~1 frosted_ice run setblock ~0 ~-1 ~1 frosted_ice[age=0]
execute if score Global iceType matches 0 as @a at @s unless block ~1 ~-1 ~1 bedrock unless block ~1 ~-1 ~1 frosted_ice run setblock ~1 ~-1 ~1 frosted_ice[age=0]

# Regular ice
execute if score Global iceType matches 1 as @a at @s unless block ~-1 ~-1 ~-1 bedrock run setblock ~-1 ~-1 ~-1 ice
execute if score Global iceType matches 1 as @a at @s unless block ~0 ~-1 ~-1 bedrock run setblock ~0 ~-1 ~-1 ice
execute if score Global iceType matches 1 as @a at @s unless block ~1 ~-1 ~-1 bedrock run setblock ~1 ~-1 ~-1 ice
execute if score Global iceType matches 1 as @a at @s unless block ~-1 ~-1 ~0 bedrock run setblock ~-1 ~-1 ~0 ice
execute if score Global iceType matches 1 as @a at @s unless block ~0 ~-1 ~0 bedrock run setblock ~0 ~-1 ~0 ice
execute if score Global iceType matches 1 as @a at @s unless block ~1 ~-1 ~0 bedrock run setblock ~1 ~-1 ~0 ice
execute if score Global iceType matches 1 as @a at @s unless block ~-1 ~-1 ~1 bedrock run setblock ~-1 ~-1 ~1 ice
execute if score Global iceType matches 1 as @a at @s unless block ~0 ~-1 ~1 bedrock run setblock ~0 ~-1 ~1 ice
execute if score Global iceType matches 1 as @a at @s unless block ~1 ~-1 ~1 bedrock run setblock ~1 ~-1 ~1 ice

# Packed ice
execute if score Global iceType matches 2 as @a at @s unless block ~-1 ~-1 ~-1 bedrock run setblock ~-1 ~-1 ~-1 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~0 ~-1 ~-1 bedrock run setblock ~0 ~-1 ~-1 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~1 ~-1 ~-1 bedrock run setblock ~1 ~-1 ~-1 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~-1 ~-1 ~0 bedrock run setblock ~-1 ~-1 ~0 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~0 ~-1 ~0 bedrock run setblock ~0 ~-1 ~0 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~1 ~-1 ~0 bedrock run setblock ~1 ~-1 ~0 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~-1 ~-1 ~1 bedrock run setblock ~-1 ~-1 ~1 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~0 ~-1 ~1 bedrock run setblock ~0 ~-1 ~1 packed_ice
execute if score Global iceType matches 2 as @a at @s unless block ~1 ~-1 ~1 bedrock run setblock ~1 ~-1 ~1 packed_ice

# Blue ice
execute if score Global iceType matches 3 as @a at @s unless block ~-1 ~-1 ~-1 bedrock run setblock ~-1 ~-1 ~-1 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~0 ~-1 ~-1 bedrock run setblock ~0 ~-1 ~-1 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~1 ~-1 ~-1 bedrock run setblock ~1 ~-1 ~-1 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~-1 ~-1 ~0 bedrock run setblock ~-1 ~-1 ~0 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~0 ~-1 ~0 bedrock run setblock ~0 ~-1 ~0 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~1 ~-1 ~0 bedrock run setblock ~1 ~-1 ~0 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~-1 ~-1 ~1 bedrock run setblock ~-1 ~-1 ~1 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~0 ~-1 ~1 bedrock run setblock ~0 ~-1 ~1 blue_ice
execute if score Global iceType matches 3 as @a at @s unless block ~1 ~-1 ~1 bedrock run setblock ~1 ~-1 ~1 blue_ice
