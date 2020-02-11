# input 1 : minecraft:honeycomb
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 4

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/honeycomb
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1

# try to add items
execute if score @s mcrac_ok matches 1 run function mcr-autocraft:count_empty_slots
execute if score @s mcrac_ok matches 1 if score @s empty_slots matches 1.. run loot insert ^ ^ ^-1 loot mcr-autocraft:honeycomb_block_1
execute if score @s mcrac_ok matches 1 if score @s empty_slots matches 1.. run scoreboard players set @s mcrac_gave 1

# if ok, remove crafting items
scoreboard players operation @s item_need = @s mcrac_n_1
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/honeycomb
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run function mcr-autocraft:sound
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run function mcr-autocraft:cooldown