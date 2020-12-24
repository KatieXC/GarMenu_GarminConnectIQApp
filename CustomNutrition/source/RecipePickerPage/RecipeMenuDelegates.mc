/* File: RecipeMenuDelegate1, RecipeMenuDelegate2 */
using Toybox.WatchUi;
using Toybox.Graphics;

//--------- Recipe Meal Menu Delegate ---------//
class RecipeMenuDelegate1 extends WatchUi.Menu2InputDelegate {
    
    var dayMenu;            // Day type Menu2 object

    function initialize() {
        WatchUi.Menu2InputDelegate.initialize();
    }

    // Handle select key press -- Go to next menu
    function onSelect(item) {
        // Get value from item & create plate day menu
        var meal_selected = item.getLabel();

        // dayMenu = new WatchUi.Menu2({:title=>"Find a "+meal_selected+" Recipe"});
        dayMenu = new WatchUi.Menu2({:title=>Rez.Strings.recipe_picker_prompt});
        dayMenu.addItem(
            new WatchUi.MenuItem(Rez.Strings.nutrition_option1, null, "easy", {})
        );
        dayMenu.addItem(
            new WatchUi.MenuItem(Rez.Strings.nutrition_option2, null, "moderate", {})
        );
        dayMenu.addItem(
            new WatchUi.MenuItem(Rez.Strings.nutrition_option3, null, "hard", {})
        );

        // Push menu w/ delegate to screen
        WatchUi.pushView(dayMenu, new RecipeMenuDelegate2(meal_selected), WatchUi.SLIDE_LEFT);
        return true;
    }
}

//--------- Recipe Day Menu Delegate ----------//
class RecipeMenuDelegate2 extends WatchUi.Menu2InputDelegate {

    var meal;               // Selected meal type from menu 1
    var day;                // Selected day type from menu 2

    function initialize(prev_item) {
        WatchUi.Menu2InputDelegate.initialize();
        meal = prev_item;
    }

    // Handle select key press -- Go to recipe display
    function onSelect(item) {
        day = item.getLabel();
        var recipe = getRecipe(meal, day);      // Create recipe view based on selections
        WatchUi.pushView(recipe, new WatchUi.BehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);
    }
}