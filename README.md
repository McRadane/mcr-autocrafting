![redirectto's Auto-Crafting](.github/logo.png)

This datapack is able to automatically craft an item every 10s (configurable) per item frame.

This datapack is based on the work of [McRadane's Auto-Crafting](https://github.com/McRadane/mcr-autocrafting) which allows you to autocraft any vanilla craftable item except for firework stars, firework rockets or banner duplication.

To enable autocrafting you need to follow the next steps:
 * Place an item frame on a container such as a chest, a barrel, a shulker, a dispenser, a dropper or a hopper
 * Rename the item you want to automate to "AutoCraft"
 * Place it into the item frame
 * Put the base materials of the recipe you want to use in order to let the system craft that item
 
# List of Changes:

### Item duplication/remove fix:
When removing the ingredients of the crafting in the original code it replaced the number of items of the inventory slots that matches the name id with the total amount minus the number of items needed for the craft.

The problem lies when you get more than 1 separate input slots, with the old code it will start duplicating the ingredients and at some point the numbers would get so high that the items would get deleted.

Now it is totally fixed and if a recipe can use diferent types of a similar item like for example the smoker which can use every type of log it will be removing the ingredients when crafting from the bottom right slot leftwards using whatever ingredient you put into the container.

### New crafting recipes:
With minecraft update 1.15 we got some reworked crafting recipes (composter and dark prismarine) and new crafting recipes (stripped woods, beehive, honey_block, honey_bottle).

And now minecraft update 1.16 is out, so I had to redo some of the recipes to be consistent with the new types of "wood" and add a lot of new ones.

Apart from the updates I added some extra recipes with nbt tags such as the basic firework rockets (paper + gunpowder) or the suspicious stews.

### Full Inventory ingredient deletion fix:
In the original code when the container slots were completely filled with items the system would try to craft anyways so it didn't matter if it could or couldn't craft the items the system would remove the ingredients in any case.

Now the system checks for the container to have at least 1 empty slot (or 2 in the case of cake and honey block) in order to be able to craft.

In version 1.1 onwards you can autocraft on other containers like dispensers, droppers or hoppers.

### Added byproducts:
Cake and Honey block recipes also get some items back, buckets and glass bottles respectively.

### Easy customizable cooldown and sounds:
Cooldowns are easy to customize with the following command:
```
/scoreboard players set #mcr_0 mcrac_cooldown 200
```

To customize the sound that plays when a craft is performed you can unzip the datapack, go to the folder data\mcr-autocraft\functions and edit the sound.mcfunction file.

I don't know why they would change the sounds but **maybe they want to hear screaming ghasts**, who knows.

### Clean of the code:
As most of the code is changed I removed some unnecessary "variables" and functions of the old code.

# Crafting recipes:
An image is worth 1000 words and this page is worth a lot of images (you still cannot craft any firework stars, most of the firework rockets or duplicate a banner) [craftinginfo](https://www.minecraftcrafting.info) (outdated for 1.16)

If you still prefer the words: [crafting recipes](https://pastebin.com/pbqrBm0n)

# Custom crafting recipes
You can add your own custom crafting recipes to this datapack following this [tutorial](https://imgur.com/a/zB3Yqif)

# Found any glitch? Have any suggestion?
Feel free to [open a new issue](https://github.com/redirectto/mcr-autocrafting/issues/new)!
