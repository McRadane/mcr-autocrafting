# input 1 : #minecraft:#dark_oak_logs
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 1
scoreboard players set @s mcrac_ic_1_t1 0
scoreboard players set @s mcrac_ic_1_t1_d 0
scoreboard players set @s mcrac_ic_1_t2 0
scoreboard players set @s mcrac_ic_1_t2_d 0
scoreboard players set @s mcrac_ic_1_t3 0
scoreboard players set @s mcrac_ic_1_t3_d 0
scoreboard players set @s mcrac_ic_1_t4 0
scoreboard players set @s mcrac_ic_1_t4_d 0

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/dark_oak_log
scoreboard players operation @s mcrac_ic_1_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/dark_oak_wood
scoreboard players operation @s mcrac_ic_1_t2 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_dark_oak_log
scoreboard players operation @s mcrac_ic_1_t3 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_dark_oak_wood
scoreboard players operation @s mcrac_ic_1_t4 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1

# calculate new count of items
execute if score @s mcrac_ok matches 1 run function mcr-autocraft:tags/prepare_1_to_4
execute if score @s mcrac_ok matches 1 run function mcr-autocraft:tags/calculate_4
execute if score @s mcrac_ok matches 1 run function mcr-autocraft:tags/return_1_from_4

# try to add items
execute if score @s mcrac_ok matches 1 store result score @s mcrac_gave run loot insert ^ ^ ^-1 loot mcr-autocraft:dark_oak_planks_4

# if ok, remove crafting items
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:dark_oak_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t1
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t2_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:dark_oak_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t2
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t3_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_dark_oak_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t3
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t4_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_dark_oak_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t4

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.5
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run scoreboard players set @s mcrac_cd 200