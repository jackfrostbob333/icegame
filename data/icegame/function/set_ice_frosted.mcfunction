# set_ice_frosted.mcfunction - Sets ice type to frosted ice (withers away)
scoreboard players set Global iceType 0
tellraw @a {"text":"Ice type set to: Frosted Ice (melts away)","color":"aqua"}
