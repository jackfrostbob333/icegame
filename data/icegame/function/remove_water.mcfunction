# remove_water.mcfunction - Removes water created by melting frosted ice
# Called every tick to clean up water around players

# Remove water and flowing water in a 7x7x7 area around each player
# This cleans up water left behind by frosted ice melting
execute as @a at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace minecraft:water
execute as @a at @s run fill ~-3 ~-3 ~-3 ~3 ~3 ~3 air replace minecraft:flowing_water
