# input 1 : minecraft:egg
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 1
scoreboard players set @s mcrac_ic_1_t1 0
scoreboard players set @s mcrac_ic_1_t1_d 0

# input 2 : minecraft:pumpkin
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 1
scoreboard players set @s mcrac_ic_2_t1 0
scoreboard players set @s mcrac_ic_2_t1_d 0

# input 3 : minecraft:sugar
scoreboard players set @s mcrac_ic_3 0
scoreboard players set @s mcrac_n_3 1
scoreboard players set @s mcrac_ic_3_t1 0
scoreboard players set @s mcrac_ic_3_t1_d 0

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/egg
scoreboard players operation @s mcrac_ic_1_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/pumpkin
scoreboard players operation @s mcrac_ic_2_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

function mcr-autocraft:count/sugar
scoreboard players operation @s mcrac_ic_3_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_3 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_3 >= @s mcrac_n_3 run scoreboard players add @s mcrac_ok 1

# calculate new count of items
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/prepare_1_to_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/return_1_from_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/prepare_2_to_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/return_2_from_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/prepare_3_to_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:tags/return_3_from_1

# try to add items
execute if score @s mcrac_ok matches 3 store result score @s mcrac_gave run loot insert ^ ^ ^-1 loot mcr-autocraft:pumpkin_pie_1

# if ok, remove crafting items
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:egg"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t1
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 if score @s mcrac_ic_2_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:pumpkin"}].Count short 1 run scoreboard players get @s mcrac_ic_2_t1
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 if score @s mcrac_ic_3_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:sugar"}].Count short 1 run scoreboard players get @s mcrac_ic_3_t1

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.5
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run scoreboard players set @s mcrac_cd 200