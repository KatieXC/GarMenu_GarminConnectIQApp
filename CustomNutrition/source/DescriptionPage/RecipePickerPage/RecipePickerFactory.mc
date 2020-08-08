/* NOT USED */
/* File: RecipePickerFactory, RecipePickerPage, RecipePickerPageDelegate */

// using Toybox.Graphics;
// using Toybox.WatchUi;

// class RecipePickerFactory extends WatchUi.PickerFactory {
//     var mealOptions;        // Array of options in picker

//     function initialize(words) {
//         PickerFactory.initialize();
//         mealOptions = words;
//     }

//     function getIndex(value) {
//         if(value instanceof String) {
//             for(var i = 0; i < mealOptions.size(); ++i) {
//                 if(value.equals(WatchUi.loadResource(mealOptions[i]))) {
//                     return i;
//                 }
//             }
//         }
//         else {
//             for(var i = 0; i < mealOptions.size(); ++i) {
//                 if(mealOptions[i].equals(value)) {
//                     return i;
//                 }
//             }
//         }
//         return 0;
//     }

//     function getSize() {
//         return mealOptions.size();
//     }

//     function getValue(index) {
//         return mealOptions[index];
//     }

//     function getDrawable(index, selected) {
//         return new WatchUi.Text({
//             :text=>mealOptions[index],
//             :color=>Graphics.COLOR_WHITE,
//             :font=>Graphics.FONT_MEDIUM,
//             :locX=>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_CENTER
//             // :width=>50,
//             // :height=>50
//             });

//         // return new WatchUi.TextArea({
//         //     :text=>mealOptions[index],
//         //     :color=>Graphics.COLOR_WHITE,
//         //     :font=>Graphics.FONT_MEDIUM,
//         //     :locX=>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_CENTER,
//         //     :width=>50,
//         //     :height=>50
//         //     });
//     }
    
// }

// class RecipePickerPage extends WatchUi.Picker {

//     function initialize() {
//         // Set title
//         var title = new WatchUi.Text({
//             :text=>Rez.Strings.recipe_picker_prompt,
//             :locX =>WatchUi.LAYOUT_HALIGN_CENTER, :locY=>WatchUi.LAYOUT_VALIGN_TOP,
//             :color=>Graphics.COLOR_WHITE
//             });
//         // Create two factories with rez strings -- (1) meal type & (2) nutrition options
//         var mealFactory = new RecipePickerFactory(
//             [Rez.Strings.meal_option1, Rez.Strings.meal_option2, Rez.Strings.meal_option3]
//             );
//         var nutriFactory = new RecipePickerFactory(
//             [Rez.Strings.nutrition_option1, Rez.Strings.nutrition_option3, Rez.Strings.nutrition_option2]
//             );

//         // Use both factories to create picker
//         Picker.initialize({:title=>title, :pattern=>[mealFactory, nutriFactory]});
//     }

//     function onUpdate(dc) {
//         Picker.onUpdate(dc);
//     }

// }

// class RecipePickerPageDelegate extends WatchUi.PickerDelegate {

//     function initialize() {
//         PickerDelegate.initialize();
//     }

//     function onCancel() {
//         WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
//     }

//     function onAccept(values) {
//         var recipe = getRecipe(values[0], values[1]);
//         WatchUi.pushView(recipe, new WatchUi.BehaviorDelegate(), WatchUi.SLIDE_IMMEDIATE);
//     }

// }