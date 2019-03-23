# input 1 : #minecraft:#wool
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
scoreboard players set @s mcrac_ic_1_t13 0
scoreboard players set @s mcrac_ic_1_t13_d 0
scoreboard players set @s mcrac_ic_1_t14 0
scoreboard players set @s mcrac_ic_1_t14_d 0
scoreboard players set @s mcrac_ic_1_t15 0
scoreboard players set @s mcrac_ic_1_t15_d 0
scoreboard players set @s mcrac_ic_1_t16 0
scoreboard players set @s mcrac_ic_1_t16_d 0

# input 2 : minecraft:stick
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 8
scoreboard players set @s mcrac_ic_2_t1 0
scoreboard players set @s mcrac_ic_2_t1_d 0

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/white_wool
scoreboard players operation @s mcrac_ic_1_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/orange_wool
scoreboard players operation @s mcrac_ic_1_t2 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/magenta_wool
scoreboard players operation @s mcrac_ic_1_t3 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/light_blue_wool
scoreboard players operation @s mcrac_ic_1_t4 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/yellow_wool
scoreboard players operation @s mcrac_ic_1_t5 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/lime_wool
scoreboard players operation @s mcrac_ic_1_t6 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/pink_wool
scoreboard players operation @s mcrac_ic_1_t7 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/gray_wool
scoreboard players operation @s mcrac_ic_1_t8 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/light_gray_wool
scoreboard players operation @s mcrac_ic_1_t9 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/cyan_wool
scoreboard players operation @s mcrac_ic_1_t10 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/purple_wool
scoreboard players operation @s mcrac_ic_1_t11 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/blue_wool
scoreboard players operation @s mcrac_ic_1_t12 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/brown_wool
scoreboard players operation @s mcrac_ic_1_t13 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/green_wool
scoreboard players operation @s mcrac_ic_1_t14 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/red_wool
scoreboard players operation @s mcrac_ic_1_t15 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/black_wool
scoreboard players operation @s mcrac_ic_1_t16 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stick
scoreboard players operation @s mcrac_ic_2_t1 = @s mcrac_tt
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1

# calculate new count of items
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/prepare_1_to_16
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/calculate_16
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/return_1_from_16
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/prepare_2_to_1
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/calculate_1
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:tags/return_2_from_1

# try to add items
execute if score @s mcrac_ok matches 2 store result score @s mcrac_gave run loot insert ^ ^ ^-1 loot mcr-autocraft:painting_1

# if ok, remove crafting items
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:white_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t1
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t2_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:orange_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t2
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t3_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:magenta_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t3
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t4_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:light_blue_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t4
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t5_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:yellow_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t5
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t6_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:lime_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t6
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t7_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:pink_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t7
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t8_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:gray_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t8
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t9_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:light_gray_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t9
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t10_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:cyan_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t10
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t11_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:purple_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t11
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t12_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:blue_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t12
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t13_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:brown_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t13
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t14_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:green_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t14
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t15_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:red_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t15
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_1_t16_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:black_wool"}].Count short 1 run scoreboard players get @s mcrac_ic_1_t16
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 if score @s mcrac_ic_2_t1_d matches 1 store result block ^ ^ ^-1 Items[{id:"minecraft:stick"}].Count short 1 run scoreboard players get @s mcrac_ic_2_t1

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run playsound minecraft:block.chest.locked block @a ~ ~ ~ 0.5
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run scoreboard players set @s mcrac_cd 200