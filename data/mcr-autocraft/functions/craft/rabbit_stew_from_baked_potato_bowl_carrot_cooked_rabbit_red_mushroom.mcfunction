# input 1 : minecraft:baked_potato
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 1

# input 2 : minecraft:bowl
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 1

# input 3 : minecraft:carrot
scoreboard players set @s mcrac_ic_3 0
scoreboard players set @s mcrac_n_3 1

# input 4 : minecraft:cooked_rabbit
scoreboard players set @s mcrac_ic_4 0
scoreboard players set @s mcrac_n_4 1

# input 5 : minecraft:red_mushroom
scoreboard players set @s mcrac_ic_5 0
scoreboard players set @s mcrac_n_5 1

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/baked_potato
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/bowl
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

function mcr-autocraft:count/carrot
scoreboard players operation @s mcrac_ic_3 += @s mcrac_tt

function mcr-autocraft:count/cooked_rabbit
scoreboard players operation @s mcrac_ic_4 += @s mcrac_tt

function mcr-autocraft:count/red_mushroom
scoreboard players operation @s mcrac_ic_5 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_3 >= @s mcrac_n_3 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_4 >= @s mcrac_n_4 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_5 >= @s mcrac_n_5 run scoreboard players add @s mcrac_ok 1

# try to add items
execute if score @s mcrac_ok matches 5 run function mcr-autocraft:empty_slots
execute if score @s mcrac_ok matches 5 if score @s empty_slots matches 1.. run loot insert ^ ^ ^-1 loot mcr-autocraft:rabbit_stew_1
execute if score @s mcrac_ok matches 5 if score @s empty_slots matches 1.. run scoreboard players set @s mcrac_gave 1

# if ok, remove crafting items
scoreboard players operation @s item_need = @s mcrac_n_1
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/baked_potato
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_2
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/bowl
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_3
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/carrot
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_4
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/cooked_rabbit
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_5
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/red_mushroom
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:sound
execute if score @s mcrac_ok matches 5 if score @s mcrac_gave matches 1 run function mcr-autocraft:cooldown