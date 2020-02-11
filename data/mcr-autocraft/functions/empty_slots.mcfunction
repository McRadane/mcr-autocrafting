scoreboard players set @s empty_slots 0
execute if block ^ ^ ^-1 chest run scoreboard players set @s empty_slots 27
execute if block ^ ^ ^-1 trapped_chest run scoreboard players set @s empty_slots 27
execute if block ^ ^ ^-1 barrel run scoreboard players set @s empty_slots 27
execute if block ^ ^ ^-1 #shulker_boxes run scoreboard players set @s empty_slots 27
execute if block ^ ^ ^-1 dispenser run scoreboard players set @s empty_slots 9
execute if block ^ ^ ^-1 dropper run scoreboard players set @s empty_slots 9
execute if block ^ ^ ^-1 hopper run scoreboard players set @s empty_slots 5

execute if score @s empty_slots matches 5.. run function mcr-autocraft:count_empty_slots