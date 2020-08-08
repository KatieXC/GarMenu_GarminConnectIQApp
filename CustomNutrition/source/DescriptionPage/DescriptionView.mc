using Toybox.WatchUi;
using Toybox.Graphics;

class DescriptionPageView extends WatchUi.View {
    var descDraw;
    var titleDraw;

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

    /* Load your resources here */
    function onLayout(dc) {
    }

    /* Called when this View is brought to the foreground */
    // Restore this View state, load rc's to mem, & prepare it to be shown
    function onShow() {
    }

    /* Update the view */
    function onUpdate(dc) {
        dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
        dc.clear();
        var h = dc.getHeight();
        var w = dc.getWidth();

        // Update title and paragraph locations & sizes
        var tw = w * 0.8;
        var th = dc.getFontHeight(Graphics.FONT_SMALL) + 10;
        var tx = WatchUi.LAYOUT_HALIGN_CENTER;
        var ty = h * 0.15;

        titleDraw.setSize(tw, th);
        titleDraw.setLocation(tx, ty);

        var dw = w * 0.85;
        var dh = 5 * dc.getFontHeight(Graphics.FONT_XTINY) + 20;
        var dx = WatchUi.LAYOUT_HALIGN_CENTER;
        var dy = ty + th;

        descDraw.setSize(dw, dh);
        descDraw.setLocation(dx, dy);

        // Draw both text areas to screen
        titleDraw.draw(dc);
        descDraw.draw(dc);
        var rc = WatchUi.loadResource(Rez.Drawables.DownArrow);
        dc.drawBitmap((w/2)-(rc.getWidth()/2), h*0.85, rc);
    }

    /* Called when this View is removed from the screen */
    // Save this View state here & free rc's from mem
    function onHide() {
    }
    
}

class DescriptionPage2View extends WatchUi.View {
    var descDraw;

    function initialize() {
        View.initialize();
        descDraw = new WatchUi.TextArea({:text=>Rez.Strings.app_description_2,
                                         :color=>Graphics.COLOR_WHITE,
                                         :font=>Graphics.FONT_XTINY,
                                         :justification=>Graphics.TEXT_JUSTIFY_CENTER,
                                         :locX=>WatchUi.LAYOUT_HALIGN_CENTER
                                         });
    }

    /* Load your resources here */
    function onLayout(dc) {
        dc.setColor(Graphics.COLOR_TRANSPARENT, Graphics.COLOR_BLACK);
        dc.clear();
    }

    /* Called when this View is brought to the foreground */
    // Restore this View state, load rc's to mem, & prepare it to be shown
    function onShow() {
    }

    /* Update the view */
    function onUpdate(dc) {
        var h = dc.getHeight();
        var w = dc.getWidth();

        // Update title and paragraph locations & sizes
        var dw = w * 0.85;
        var dh = h * 0.75;
        var dx = WatchUi.LAYOUT_HALIGN_CENTER;
        var dy = h * 0.25;

        descDraw.setSize(dw, dh);
        descDraw.setLocation(dx, dy);

        // Draw both text areas to screen
        descDraw.draw(dc);
    }

    /* Called when this View is removed from the screen */
    // Save this View state here & free rc's from mem
    function onHide() {
    }
    
}