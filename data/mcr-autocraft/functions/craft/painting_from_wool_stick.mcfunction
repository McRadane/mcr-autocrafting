# input 1 : #minecraft:#wool
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 1

# input 2 : minecraft:stick
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 8

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/white_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/orange_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/magenta_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/light_blue_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/yellow_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/lime_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/pink_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/gray_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/light_gray_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/cyan_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/purple_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/blue_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/brown_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/green_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/red_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/black_wool
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/stick
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1

# try to add items
execute if score @s mcrac_ok matches 2 run function mcr-autocraft:empty_slots
execute if score @s mcrac_ok matches 2 if score @s empty_slots matches 1.. run loot insert ^ ^ ^-1 loot mcr-autocraft:painting_1
execute if score @s mcrac_ok matches 2 if score @s empty_slots matches 1.. run scoreboard players set @s mcrac_gave 1

# if ok, remove crafting items
scoreboard players operation @s item_need = @s mcrac_n_1
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/wool
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_2
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/stick
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run function mcr-autocraft:sound
execute if score @s mcrac_ok matches 2 if score @s mcrac_gave matches 1 run function mcr-autocraft:cooldown