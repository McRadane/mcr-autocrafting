# input 1 : #minecraft:#logs
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 4
scoreboard players set @s mcrac_ic_1_t1 0
scoreboard players set @s mcrac_ic_1_t1_d 0
scoreboard players set @s mcrac_ic_1_t2 0
scoreboard players set @s mcrac_ic_1_t2_d 0
scoreboard players set @s mcrac_ic_1_t3 0
scoreboard players set @s mcrac_ic_1_t3_d 0
scoreboard players set @s mcrac_ic_1_t4 0
scoreboard players set @s mcrac_ic_1_t4_d 0
scoreboard players set @s mcrac_ic_1_t5 0
scoreboard players set @s mcrac_ic_1_t5_d 0
scoreboard players set @s mcrac_ic_1_t6 0
scoreboard players set @s mcrac_ic_1_t6_d 0
scoreboard players set @s mcrac_ic_1_t7 0
scoreboard players set @s mcrac_ic_1_t7_d 0
scoreboard players set @s mcrac_ic_1_t8 0
scoreboard players set @s mcrac_ic_1_t8_d 0
scoreboard players set @s mcrac_ic_1_t9 0
scoreboard players set @s mcrac_ic_1_t9_d 0
scoreboard players set @s mcrac_ic_1_t10 0
scoreboard players set @s mcrac_ic_1_t10_d 0
scoreboard players set @s mcrac_ic_1_t11 0
scoreboard players set @s mcrac_ic_1_t11_d 0
scoreboard players set @s mcrac_ic_1_t12 0
scoreboard players set @s mcrac_ic_1_t12_d 0

# input 2 : minecraft:furnace
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 1
scoreboard players set @s mcrac_ic_2_t1 0
scoreboard players set @s mcrac_ic_2_t1_d 0

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/jungle_log
scoreboard players operation @s mcrac_ic_1_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/jungle_wood
scoreboard players operation @s mcrac_ic_1_t2 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_jungle_log
scoreboard players operation @s mcrac_ic_1_t3 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_jungle_wood
scoreboard players operation @s mcrac_ic_1_t4 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/spruce_log
scoreboard players operation @s mcrac_ic_1_t5 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/spruce_wood
scoreboard players operation @s mcrac_ic_1_t6 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_spruce_log
scoreboard players operation @s mcrac_ic_1_t7 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_spruce_wood
scoreboard players operation @s mcrac_ic_1_t8 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/birch_log
scoreboard players operation @s mcrac_ic_1_t9 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/birch_wood
scoreboard players operation @s mcrac_ic_1_t10 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_birch_log
scoreboard players operation @s mcrac_ic_1_t11 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stripped_birch_wood
scoreboard players operation @s mcrac_ic_1_t12 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/furnace
scoreboard players operation @s mcrac_ic_2_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1

# calculate new count of items
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/prepare_1_to_12
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/calculate_12
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/return_1_from_12
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/prepare_2_to_1
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/return_2_from_1

# try to add items
execute if score @s mcrac_ok matches 2 store result score @s mcrac_gave run loot insert ^ ^ ^-1 loot mcr-autocraft:smoker_1

# if ok, remove crafting items
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:jungle_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t1
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t2_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:jungle_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t2
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t3_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_jungle_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t3
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t4_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_jungle_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t4
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t5_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:spruce_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t5
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t6_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:spruce_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t6
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t7_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_spruce_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t7
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t8_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_spruce_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t8
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t9_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:birch_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t9
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t10_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:birch_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t10
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t11_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_birch_log"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t11
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t12_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stripped_birch_wood"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t12
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_2_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:furnace"}].Count short 1 run scoreboard players get @s mcrac_ic_2_t1

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.5
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run scoreboard players set @s mcrac_cd 200