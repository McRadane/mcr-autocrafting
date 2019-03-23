# input 1 : #minecraft:#mcr_custom_sandstone_chiseled_sandstone
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 3
scoreboard players set @s mcrac_ic_1_t1 0
scoreboard players set @s mcrac_ic_1_t1_d 0
scoreboard players set @s mcrac_ic_1_t2 0
scoreboard players set @s mcrac_ic_1_t2_d 0

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/sandstone
scoreboard players operation @s mcrac_ic_1_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/chiseled_sandstone
scoreboard players operation @s mcrac_ic_1_t2 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1

# calculate new count of items
execute if score @s mcrac_ok matches 1 run function mcr-autocraft:tags/prepare_1_to_2
execute if score @s mcrac_ok matches 1 run function mcr-autocraft:tags/calculate_2
execute if score @s mcrac_ok matches 1 run function mcr-autocraft:tags/return_1_from_2

# try to add items
execute if score @s mcrac_ok matches 1 store result score @s mcrac_gave run loot insert ^ ^ ^-1 loot mcr-autocraft:sandstone_slab_6

# if ok, remove crafting items
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:sandstone"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t1
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t2_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:chiseled_sandstone"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t2

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.5
execute if score @s mcrac_ok matches 1 if score @s mcrac_gave matches 1 run scoreboard players set @s mcrac_cd 200