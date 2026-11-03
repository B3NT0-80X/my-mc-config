import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI;
import crafttweaker.oredict.IOreDict;
import crafttweaker.oredict.IOreDictEntry;

// ==========================================
// JEI Removals & Hides
// ==========================================

JEI.removeAndHide(<animania:block_mud>);
JEI.removeAndHide(<animania:riding_crop>);
JEI.removeAndHide(<animania:item_wagon>);
JEI.removeAndHide(<animania:item_cart>);
JEI.removeAndHide(<animania:wheel>);
JEI.removeAndHide(<animania:item_tiller>);

// ==========================================
// Ore Dictionary
// ==========================================

<ore:listAllrabbitraw>.add(<animania:raw_prime_rabbit>);

// ==========================================
// Recipe Removals & Additions
// ==========================================

recipes.removeByRecipeName("animania:straw");
recipes.removeByRecipeName("animania:bed");

// Carving knife recipe
recipes.remove(<animania:carving_knife>);
recipes.addShapedMirrored("carving_knife", <animania:carving_knife>, [
    [<ore:genericMetalNuggets>, <ore:genericMetal>],
    [<ore:genericMetalNuggets>, <ore:genericMetal>],
    [null, <ore:stickWood>]
]);

// Straw crafting using carving knife and grains
recipes.remove(<animania:block_straw>);
recipes.addShapeless("grain_to_straw", <animania:block_straw>, [
    <animania:carving_knife>.anyDamage().reuse().transformDamage(1), 
    <minecraft:wheat> | <harvestcraft:ryeitem> | <harvestcraft:oatsitem> | <harvestcraft:barleyitem>
]);

// Salt lick crafting using vanilla water bucket
var qualitybucket = <minecraft:water_bucket>.transformReplace(<minecraft:bucket>);

recipes.removeByRecipeName("animania:salt_lick_0");
recipes.removeByRecipeName("animania:salt_lick_1");
recipes.addShapeless("salt_lick_vanilla", <animania:salt_lick>, [
    <ore:itemSalt>, <ore:itemSalt>, <ore:itemSalt>, 
    <ore:itemSalt>, <ore:itemSalt>, <ore:itemSalt>, 
    <ore:itemSalt>, <ore:itemSalt>, qualitybucket.reuse()
]);

// ==========================================
// Milk Bottling
// ==========================================

var bovid_milk = 
    <forge:bucketfilled>.withTag({FluidName: "milk_goat", Amount: 1000}) |
    <forge:bucketfilled>.withTag({FluidName: "milk_sheep", Amount: 1000});

var deluxeMilk = 
    <forge:bucketfilled>.withTag({FluidName: "milk_holstein", Amount: 1000}) |
    <forge:bucketfilled>.withTag({FluidName: "milk_friesian", Amount: 1000}) |
    <forge:bucketfilled>.withTag({FluidName: "milk_jersey", Amount: 1000});

recipes.remove(<animania:milk_bottle>);
recipes.addShapeless("bottle_of_milk", <animania:milk_bottle>, [<ore:listAllmilk>, <minecraft:glass_bottle>]);
recipes.addShapeless("bottle_of_bovid_milk", <animania:milk_bottle>, [bovid_milk, <minecraft:glass_bottle>]);
recipes.addShapeless("bottle_of_deluxe_milk", <animania:milk_bottle> * 2, [deluxeMilk, <minecraft:glass_bottle>, <minecraft:glass_bottle>]);

// ==========================================
// Omelette Recipe
// ==========================================

// Smelt standard chicken eggs into Animania omelettes
furnace.addRecipe(<animania:plain_omelette>, <minecraft:egg>, 0.35);