using Toybox.WatchUi;
using Toybox.Graphics;

//----------- Recipe Page View -----------//
class RecipeView extends WatchUi.View {

    var title = "<Insert Recipe Title>";
    var description = "<Insert Recipe Description>";
    var titleDraw;
    var descripDraw;
    var websiteDraw;

    function initialize(t, d) {
        View.initialize();

        // Set title and description strings & create TextArea Drawables
        if (t!=null && d!=null) {
            title = t;
            description = d;
        }
        titleDraw = new WatchUi.TextArea({:text=>title,
                                          :color=>Graphics.COLOR_BLUE,
                                          :font=>Graphics.FONT_MEDIUM,
                                          :justification=>Graphics.TEXT_JUSTIFY_CENTER,
                                          :locX=>WatchUi.LAYOUT_HALIGN_CENTER
                                          });
        descripDraw = new WatchUi.TextArea({:text=>description,
                                            :color=>Graphics.COLOR_WHITE,
                                            :font=>Graphics.FONT_XTINY,
                                            :justification=>Graphics.TEXT_JUSTIFY_CENTER,
                                            :locX=>WatchUi.LAYOUT_HALIGN_CENTER
                                            });
        websiteDraw = new WatchUi.TextArea({:text=>Rez.Strings.recipe_website,
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
        
        // Update size and location of title and description
        var tw = w * 0.79;
        var th = 3 * dc.getFontHeight(Graphics.FONT_MEDIUM) + 10;  // 3 Lines
        var tx = WatchUi.LAYOUT_HALIGN_CENTER;
        var ty = h * 0.15;

        titleDraw.setSize(tw, th);
        titleDraw.setLocation(tx, ty);

        var dw = w * 0.80;
        var dh = 2 * dc.getFontHeight(Graphics.FONT_XTINY) + 10; // 2 Lines
        var dx = WatchUi.LAYOUT_HALIGN_CENTER;
        var dy = ty + th;

        descripDraw.setSize(dw, dh);
        descripDraw.setLocation(dx, dy);

        var ww = w * 0.70;
        var wh = 2 * dc.getFontHeight(Graphics.FONT_XTINY) + 20; // 1 Line
        var wx = WatchUi.LAYOUT_HALIGN_CENTER;
        var wy = dh + dy;

        websiteDraw.setSize(ww, wh);
        websiteDraw.setLocation(wx, wy);

        // Draw both text areas to screen
        titleDraw.draw(dc);
        descripDraw.draw(dc);
        websiteDraw.draw(dc);
    }

    /* Called when this View is removed from the screen */
    // Save this View state here & free rc's from mem
    function onHide() {
    }
    
}