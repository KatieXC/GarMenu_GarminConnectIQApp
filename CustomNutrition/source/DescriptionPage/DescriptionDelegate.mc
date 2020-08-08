using Toybox.WatchUi;

class DescriptionPageDelegate extends WatchUi.BehaviorDelegate {

    function initialize() {
        BehaviorDelegate.initialize();
    }

    function onNextPage() {
        WatchUi.pushView(new DescriptionPage2View(), new BehaviorDelegate(), WatchUi.SLIDE_UP);
        return true;
    }

}