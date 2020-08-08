/* File: DescriptionPageView, DescriptionPage2View */
using Toybox.WatchUi;
using Toybox.Graphics;

//----------- Description Page View -----------//
class DescriptionPageView extends WatchUi.View {
    var descDraw;           // Description TextArea drawable
    var titleDraw;          // Title TextArea drawable

    function initialize() {
        View.initialize();
        titleDraw = new WatchUi.TextArea({:text=>Rez.Strings.description_page_title,
                                          :color=>Graphics.COLOR_BLUE,
                                          :font=>Graphics.FONT_SMALL,
                                          :justification=>Graphics.TEXT_JUSTIFY_CENTER,
                                          :locX=>WatchUi.LAYOUT_HALIGN_CENTER
                                          });
        descDraw = new WatchUi.TextArea({:text=>Rez.Strings.app_description_1,
                                         :color=>Graphics.COLOR_WHITE,
                                         :font=>Graphics.FONT_XTINY,
                                         :justification=>Graphics.TEXT_JUSTIFY_CENTER,
                                         :locX=>WatchUi.LAYOUT_HALIGN_CENTER
                                         });
    }

    function onLayout(dc) {
    }

    function onShow() {
    }

    function onUpdate(dc) {
        // Clear screen
        dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
        dc.clear();

        var h = dc.getHeight();     // Screen height
        var w = dc.getWidth();      // Screen width

        // Adjust title
        var tw = w * 0.8;
        var th = dc.getFontHeight(Graphics.FONT_SMALL) + 10;
        var tx = WatchUi.LAYOUT_HALIGN_CENTER;
        var ty = h * 0.15;

        titleDraw.setSize(tw, th);
        titleDraw.setLocation(tx, ty);

        // Adjust description
        var dw = w * 0.85;
        var dh = 5 * dc.getFontHeight(Graphics.FONT_XTINY) + 20;
        var dx = WatchUi.LAYOUT_HALIGN_CENTER;
        var dy = ty + th;

        descDraw.setSize(dw, dh);
        descDraw.setLocation(dx, dy);

        // Draw text
        titleDraw.draw(dc);
        descDraw.draw(dc);
        
        // Draw down arrow
        var rc = WatchUi.loadResource(Rez.Drawables.DownArrow);
        dc.drawBitmap((w/2)-(rc.getWidth()/2), h*0.85, rc);
    }

    function onHide() {
    }
    
}

//------- Second Description Page View --------//
class DescriptionPage2View extends WatchUi.View {
    var descDraw;           // Description TextArea drawable

    function initialize() {
        View.initialize();
        descDraw = new WatchUi.TextArea({:text=>Rez.Strings.app_description_2,
                                         :color=>Graphics.COLOR_WHITE,
                                         :font=>Graphics.FONT_XTINY,
                                         :justification=>Graphics.TEXT_JUSTIFY_CENTER,
                                         :locX=>WatchUi.LAYOUT_HALIGN_CENTER
                                         });
    }

    // Clear screen
    function onLayout(dc) {
        dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
        dc.clear();
    }

    function onShow() {
    }

    function onUpdate(dc) {
        var h = dc.getHeight();     // Screen width
        var w = dc.getWidth();      // Screen height

        // Adjust location & size
        var dw = w * 0.85;
        var dh = h * 0.75;
        var dx = WatchUi.LAYOUT_HALIGN_CENTER;
        var dy = h * 0.25;

        descDraw.setSize(dw, dh);
        descDraw.setLocation(dx, dy);

        // Draw
        descDraw.draw(dc);
    }

    function onHide() {
    }
    
}