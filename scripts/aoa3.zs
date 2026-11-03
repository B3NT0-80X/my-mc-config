import crafttweaker.item.IItemStack;
import crafttweaker.item.IIngredient;
import mods.jei.JEI;

// Remove redundant AoA3 tools
JEI.removeAndHide(<aoa3:amethyst_sword>);
JEI.removeAndHide(<aoa3:amethyst_pickaxe>);
JEI.removeAndHide(<aoa3:amethyst_shovel>);
JEI.removeAndHide(<aoa3:amethyst_axe>);

// Unify amethyst blocks
JEI.removeAndHide(<biomesoplenty:gem_block:0>);
JEI.removeAndHide(<mysticalworld:amethyst_block>);

// Unify amethyst gems into AoA3 amethyst
recipes.replaceAllOccurences(<biomesoplenty:gem:0>, <aoa3:amethyst>);
JEI.removeAndHide(<biomesoplenty:gem:0>);

// Phantasm recipe
recipes.addShapeless("Phantasm_AoA", <aoa3:phantasm>, [<aoa3:primed_ghoulasm>, <aoa3:haunted_flower>]);