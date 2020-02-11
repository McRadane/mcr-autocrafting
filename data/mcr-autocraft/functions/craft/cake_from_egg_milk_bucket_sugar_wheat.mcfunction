# input 1 : minecraft:egg
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 1

# input 2 : minecraft:milk_bucket
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 3

# input 3 : minecraft:sugar
scoreboard players set @s mcrac_ic_3 0
scoreboard players set @s mcrac_n_3 2

# input 4 : minecraft:wheat
scoreboard players set @s mcrac_ic_4 0
scoreboard players set @s mcrac_n_4 3

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/egg
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/milk_bucket
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

function mcr-autocraft:count/sugar
scoreboard players operation @s mcrac_ic_3 += @s mcrac_tt

function mcr-autocraft:count/wheat
scoreboard players operation @s mcrac_ic_4 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_3 >= @s mcrac_n_3 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_4 >= @s mcrac_n_4 run scoreboard players add @s mcrac_ok 1

# try to add items
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:count_empty_slots
execute if score @s mcrac_ok matches 4 if score @s empty_slots matches 2.. run loot insert ^ ^ ^-1 loot mcr-autocraft:cake_1
execute if score @s mcrac_ok matches 4 if score @s empty_slots matches 2.. run loot insert ^ ^ ^-1 loot mcr-autocraft:bucket_3
execute if score @s mcrac_ok matches 4 if score @s empty_slots matches 2.. run scoreboard players set @s mcrac_gave 1


# if ok, remove crafting items
scoreboard players operation @s item_need = @s mcrac_n_1
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/egg
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_2
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/milk_bucket
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_3
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/sugar
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_4
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/wheat
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:sound
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run function mcr-autocraft:cooldown