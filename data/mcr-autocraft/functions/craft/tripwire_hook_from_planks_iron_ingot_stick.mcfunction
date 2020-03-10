# input 1 : #minecraft:#planks
scoreboard players set @s mcrac_ic_1 0
scoreboard players set @s mcrac_n_1 1

# input 2 : minecraft:iron_ingot
scoreboard players set @s mcrac_ic_2 0
scoreboard players set @s mcrac_n_2 1

# input 3 : minecraft:stick
scoreboard players set @s mcrac_ic_3 0
scoreboard players set @s mcrac_n_3 1

scoreboard players set @s mcrac_gave 0
scoreboard players set @s mcrac_ok 0

# calculate costs
function mcr-autocraft:count/oak_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/spruce_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/birch_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/jungle_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/acacia_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/dark_oak_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/crimson_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/warped_planks
scoreboard players operation @s mcrac_ic_1 += @s mcrac_tt

function mcr-autocraft:count/iron_ingot
scoreboard players operation @s mcrac_ic_2 += @s mcrac_tt

function mcr-autocraft:count/stick
scoreboard players operation @s mcrac_ic_3 += @s mcrac_tt

# check if enough items
execute if score @s mcrac_ic_1 >= @s mcrac_n_1 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_2 >= @s mcrac_n_2 run scoreboard players add @s mcrac_ok 1
execute if score @s mcrac_ic_3 >= @s mcrac_n_3 run scoreboard players add @s mcrac_ok 1

# try to add items
execute if score @s mcrac_ok matches 3 run function mcr-autocraft:empty_slots
execute if score @s mcrac_ok matches 3 if score @s empty_slots matches 1.. run loot insert ^ ^ ^-1 loot mcr-autocraft:tripwire_hook_2
execute if score @s mcrac_ok matches 3 if score @s empty_slots matches 1.. run scoreboard players set @s mcrac_gave 1

# if ok, remove crafting items
scoreboard players operation @s item_need = @s mcrac_n_1
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/planks
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_2
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/iron_ingot
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove
scoreboard players operation @s item_need = @s mcrac_n_3
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:countslot/stick
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:remove

# play sound and add a cooldown(10 seconds)
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:sound
execute if score @s mcrac_ok matches 3 if score @s mcrac_gave matches 1 run function mcr-autocraft:cooldown