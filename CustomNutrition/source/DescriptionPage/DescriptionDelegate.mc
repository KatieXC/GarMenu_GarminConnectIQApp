/* File: DescriptionPageDelegate */
using Toybox.WatchUi;

//--------- Description Page Delegate ---------//
class DescriptionPageDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // Handle next page key press -- Mimic scrolling to next view
    function onNextPage() {
        WatchUi.pushView(new DescriptionPage2View(), new BehaviorDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}