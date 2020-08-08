using Toybox.WatchUi;

class TempView extends WatchUi.View {

    var phrase;

    function initialize(x) {
        if (x==null) {
            phrase = "(insert text)";
        }
        else {
            phrase = x;
        }
        View.initialize();
    }

    // Load your resources here
    function onLayout(dc) {
    }

    // Called when this View is brought to the foreground
    // Restore this View state, load rc's to mem, & prepare it to be shown
    function onShow() {
    }

    // Update the view
    function onUpdate(dc) {
        // View.onUpdate(dc); -- to redraw screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_YELLOW);
        dc.clear();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,                      // gets the width of the device and divides by 2
            dc.getHeight() / 2,                     // gets the height of the device and divides by 2
            Graphics.FONT_LARGE,                    // sets the font size
            phrase,                                 // the String to display
            Graphics.TEXT_JUSTIFY_CENTER            // sets the justification for the text
            );
    }

    // Called when this View is removed from the screen
    // Save this View state here & free rc's from mem
    function onHide() {
    }
    
}