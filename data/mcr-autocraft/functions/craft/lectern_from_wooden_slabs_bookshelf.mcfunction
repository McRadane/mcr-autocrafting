# input 1 : #minecraft:#wooden_slabs
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

# input 2 : minecraft:bookshelf
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 1
scoreboard players set @s mcrac_ic_2_t1 0
scoreboard players set @s mcrac_ic_2_t1_d 0

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/oak_slab
scoreboard players operation @s mcrac_ic_1_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/spruce_slab
scoreboard players operation @s mcrac_ic_1_t2 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/birch_slab
scoreboard players operation @s mcrac_ic_1_t3 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/jungle_slab
scoreboard players operation @s mcrac_ic_1_t4 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/acacia_slab
scoreboard players operation @s mcrac_ic_1_t5 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/dark_oak_slab
scoreboard players operation @s mcrac_ic_1_t6 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/bookshelf
scoreboard players operation @s mcrac_ic_2_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1

# calculate new count of items
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/prepare_1_to_6
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/calculate_6
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/return_1_from_6
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/prepare_2_to_1
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/return_2_from_1

# try to add items
execute if score @s mcrac_ok matches 2 store result score @s mcrac_gave run loot insert ^ ^ ^-1 loot mcr-autocraft:lectern_1

# if ok, remove crafting items
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:oak_slab"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t1
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t2_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:spruce_slab"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t2
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t3_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:birch_slab"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t3
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t4_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:jungle_slab"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t4
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t5_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:acacia_slab"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t5
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t6_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:dark_oak_slab"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t6
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_2_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:bookshelf"}].Count short 1 run scoreboard players get @s mcrac_ic_2_t1

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.5
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run scoreboard players set @s mcrac_cd 200