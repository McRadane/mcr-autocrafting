execute as @e[type=minecraft:item_frame,nbt={Item:{tag:{display:{Name:'{"text":"AutoCraft"}'}}}}] unless score @s mcrac_cd = @s mcrac_cd run scoreboard players set @s mcrac_cd 0

execute as @e[type=minecraft:item_frame,nbt={Item:{tag:{display:{Name:'{"text":"AutoCraft"}'}}}}] at @s if score @s mcrac_cd matches 0 run function mcr-autocraft:launch

execute as @e[type=minecraft:item_frame] at @s if score @s mcrac_cd matches 1.. run scoreboard players remove @s mcrac_cd 1