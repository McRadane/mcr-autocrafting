# input 1 : minecraft:iron_ingot
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 1
scoreboard players set @s mcrac_ic_1_t1 0
scoreboard players set @s mcrac_ic_1_t1_d 0

# input 2 : minecraft:stick
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 3
scoreboard players set @s mcrac_ic_2_t1 0
scoreboard players set @s mcrac_ic_2_t1_d 0

# input 3 : minecraft:string
scoreboard players set @s mcrac_ic_3 0
scoreboard players set @s mcrac_n_3 2
scoreboard players set @s mcrac_ic_3_t1 0
scoreboard players set @s mcrac_ic_3_t1_d 0

# input 4 : minecraft:tripwire_hook
scoreboard players set @s mcrac_ic_4 0
scoreboard players set @s mcrac_n_4 1
scoreboard players set @s mcrac_ic_4_t1 0
scoreboard players set @s mcrac_ic_4_t1_d 0

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/iron_ingot
scoreboard players operation @s mcrac_ic_1_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stick
scoreboard players operation @s mcrac_ic_2_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

function mcr-autocraft:count/string
scoreboard players operation @s mcrac_ic_3_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_3 += @s mcrac_tt

function mcr-autocraft:count/tripwire_hook
scoreboard players operation @s mcrac_ic_4_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_4 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_3 >= @s mcrac_n_3 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_4 >= @s mcrac_n_4 run scoreboard players add @s mcrac_ok 1

# calculate new count of items
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/prepare_1_to_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/return_1_from_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/prepare_2_to_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/return_2_from_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/prepare_3_to_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/return_3_from_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/prepare_4_to_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 4 run function mcr-autocraft:tags/return_4_from_1

# try to add items
execute if score @s mcrac_ok matches 4 store result score @s mcrac_gave run loot insert ^ ^ ^-1 loot mcr-autocraft:crossbow_1

# if ok, remove crafting items
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:iron_ingot"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t1
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 if score @s mcrac_ic_2_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stick"}].Count short 1 run scoreboard players get @s mcrac_ic_2_t1
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 if score @s mcrac_ic_3_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:string"}].Count short 1 run scoreboard players get @s mcrac_ic_3_t1
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 if score @s mcrac_ic_4_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:tripwire_hook"}].Count short 1 run scoreboard players get @s mcrac_ic_4_t1

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.5
execute if score @s mcrac_ok matches 4 if score @s mcrac_gave matches 1 run scoreboard players set @s mcrac_cd 200