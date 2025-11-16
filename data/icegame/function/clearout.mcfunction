# clearout.mcfunction - Removes all ice blocks in a large area around the player
# Called when players are holding shovels (with cooldown to prevent overflow)
# Useful for cleaning up ice trails or resetting the area

# Remove ice in multiple 8x8x8 sections to cover a larger area without overloading
# Center section (where player is)
fill ~-4 ~-4 ~-4 ~4 ~4 ~4 air replace blue_ice
fill ~-4 ~-4 ~-4 ~4 ~4 ~4 air replace packed_ice
fill ~-4 ~-4 ~-4 ~4 ~4 ~4 air replace ice

# Extended horizontal coverage (+X direction)
fill ~4 ~-4 ~-4 ~12 ~4 ~4 air replace blue_ice
fill ~4 ~-4 ~-4 ~12 ~4 ~4 air replace packed_ice
fill ~4 ~-4 ~-4 ~12 ~4 ~4 air replace ice

# Extended horizontal coverage (-X direction)
fill ~-12 ~-4 ~-4 ~-4 ~4 ~4 air replace blue_ice
fill ~-12 ~-4 ~-4 ~-4 ~4 ~4 air replace packed_ice
fill ~-12 ~-4 ~-4 ~-4 ~4 ~4 air replace ice

# Extended horizontal coverage (+Z direction)
fill ~-4 ~-4 ~4 ~4 ~4 ~12 air replace blue_ice
fill ~-4 ~-4 ~4 ~4 ~4 ~12 air replace packed_ice
fill ~-4 ~-4 ~4 ~4 ~4 ~12 air replace ice

# Extended horizontal coverage (-Z direction)
fill ~-4 ~-4 ~-12 ~4 ~4 ~-4 air replace blue_ice
fill ~-4 ~-4 ~-12 ~4 ~4 ~-4 air replace packed_ice
fill ~-4 ~-4 ~-12 ~4 ~4 ~-4 air replace ice
