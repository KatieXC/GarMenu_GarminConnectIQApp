/* File: TempView */
using Toybox.WatchUi;

//--------------- Testing View ----------------//
//  Used for debugging as placeholder view
class TempView extends WatchUi.View {

    var phrase;             // Text to be displayed to screen

    // Input: string to show on screen
    function initialize(x) {
        if (x==null) {
            phrase = "<insert text>";
        }
        else {
            phrase = x;
        }
        View.initialize();
    }

    function onLayout(dc) {
    }

    function onShow() {
    }

    // Set background color to yellow and write phrase to middle of screen
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_YELLOW);
        dc.clear();
        dc.setColor(Graphics.COLOR_BLACK, Graphics.COLOR_TRANSPARENT);
        dc.drawText(
            dc.getWidth() / 2,                      // gets the width of the device and divides by 2
            dc.getHeight() / 2,                     // gets the height of the device and divides by 2
            Graphics.FONT_LARGE,                    // sets the font size
            phrase,                                 // the string to display
            Graphics.TEXT_JUSTIFY_CENTER            // sets the justification for the text
            );
    }

    function onHide() {
    }
    
}