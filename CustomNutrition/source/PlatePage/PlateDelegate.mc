/* File: PlatePageDelegate */
using Toybox.WatchUi;

//------------ Plate Page Delegate ------------//
class PlatePageDelegate extends WatchUi.BehaviorDelegate {

    var recipeMenu;         // Meal type Menu2 object

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // Handle select key press -- Go to description page
    function onSelect() {
        WatchUi.pushView(new DescriptionPageView(), new DescriptionPageDelegate(0), WatchUi.SLIDE_LEFT);
        return true;
    }

    // Handle next page key press -- Go to recipe selection menu
    function onNextPage() {
        // Create Menu2 for meal options
        recipeMenu = new WatchUi.Menu2({:title=>Rez.Strings.recipe_picker_prompt});
        recipeMenu.addItem(
            new WatchUi.MenuItem(Rez.Strings.meal_option1, null, "breakfast", {} )
        );
        recipeMenu.addItem(
            new WatchUi.MenuItem(Rez.Strings.meal_option2, null, "lunch", {} )
        );
        recipeMenu.addItem(
            new WatchUi.MenuItem(Rez.Strings.meal_option3, null, "snack", {} )
        );

        // Push menu w/ delegate to screen
        WatchUi.pushView(recipeMenu, new RecipeMenuDelegate1(), WatchUi.SLIDE_UP);
        return true;
    }

}