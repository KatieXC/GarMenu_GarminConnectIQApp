using Toybox.WatchUi;

//----------- Top App Delegate -----------//
class CustomNutritionDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // When select button pressed, go to initial plate page
    function onSelect() {
        WatchUi.pushView(new PlatePageView(), new PlatePageDelegate(), WatchUi.SLIDE_IMMEDIATE);
        return true;
    }

}