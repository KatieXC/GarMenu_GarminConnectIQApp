/* File: DescriptionPageDelegate */
using Toybox.WatchUi;

//--------- Description Page Delegate ---------//
class DescriptionPageDelegate extends WatchUi.BehaviorDelegate {

    var flag;
    function initialize(f) {
        BehaviorDelegate.initialize();
        flag = f;
    }

    // Handle next page key press -- Mimic scrolling to next view
    function onNextPage() {
        WatchUi.pushView(new DescriptionPage2View(), new DescriptionPageDelegate2(), WatchUi.SLIDE_UP);
        return true;
    }

    function onBack() {
        if (flag) {
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
            WatchUi.popView(WatchUi.SLIDE_IMMEDIATE);
        }
    }

}

//--------- Description Page Delegate 2 ---------//
class DescriptionPageDelegate2 extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    // Handle next page key press -- Mimic scrolling to next view
    function onPreviousPage() {
        WatchUi.pushView(new DescriptionPageView(), new DescriptionPageDelegate(1), WatchUi.SLIDE_DOWN);
        return true;
    }

}