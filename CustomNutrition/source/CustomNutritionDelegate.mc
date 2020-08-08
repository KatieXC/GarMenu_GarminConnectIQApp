/* File: CustomNutritionDelegate */
using Toybox.WatchUi;

//------------- Top App Delegate --------------//
class CustomNutritionDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // Handle select key press -- Go to plate page
    function onSelect() {
        WatchUi.pushView(new PlatePageView(), new PlatePageDelegate(), WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

}