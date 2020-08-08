using Toybox.WatchUi;
using Toybox.Graphics;

//-------------- Constants ---------------//
// Color Theme
var plate_color = {"Easy"=>     Graphics.COLOR_BLUE,
                   "Moderate"=> Graphics.COLOR_GREEN,
                   "Hard"=>     Graphics.COLOR_RED};

//------------ Plate Drawable ------------//
class PlateDrawable extends WatchUi.Drawable {

    var day;        // Type of day for drawable

    // Assign day and initialize
    function initialize(d) {
        Drawable.initialize({});
        day = d;
    }

    // Overwrite draw function for plate & labels
    function draw(dc) {
        // Temp variables for location
        var x_mid = dc.getWidth()/2;
        var y_mid = dc.getHeight()/2 + dc.getFontHeight(Graphics.FONT_XTINY) + 5;
        var radius = dc.getHeight()/4;

        // Draw day header
        dc.setColor(plate_color[day], Graphics.COLOR_TRANSPARENT);
        dc.drawText(x_mid, y_mid - (radius+dc.getFontHeight(Graphics.FONT_SMALL)+5),
                    Graphics.FONT_SMALL,
                    day+" Day",
                    Graphics.TEXT_JUSTIFY_CENTER
                    );

        // Draw plate with divisions and labels
        dc.fillCircle(x_mid, y_mid, radius);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(3);
        switch(day) {
            case "Easy":
                dc.drawLine(x_mid-radius,y_mid, x_mid,y_mid);
                dc.drawLine(x_mid,y_mid-radius, x_mid,y_mid+radius);
                dc.drawText(x_mid+radius, y_mid-(radius/4),
                            Graphics.FONT_TINY,
                            "Vegetables",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                dc.drawText(x_mid-(radius*2/3), y_mid+(radius/4),
                            Graphics.FONT_TINY,
                            "Protein",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                dc.drawText(x_mid-(radius*3/4), y_mid-(radius*7/8),
                            Graphics.FONT_TINY,
                            "Whole",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                dc.drawText(x_mid-(radius*2/3), y_mid-(radius/2),
                            Graphics.FONT_TINY,
                            "Grains",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                break;
            case "Moderate":
                dc.drawLine(x_mid-radius,y_mid, x_mid,y_mid);
                dc.drawLine(x_mid,y_mid, x_mid,y_mid+radius);
                dc.drawLine(x_mid,y_mid, x_mid+(radius/1.4),y_mid-(radius/1.4));
                dc.drawText(x_mid+radius, y_mid,
                            Graphics.FONT_TINY,
                            "Vegetables",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                dc.drawText(x_mid-(radius*2/3), y_mid+(radius/4),
                            Graphics.FONT_TINY,
                            "Protein",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                dc.drawText(x_mid-(radius*1/4), y_mid-(radius*3/4),
                            Graphics.FONT_TINY,
                            "Grains",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                break;
            case "Hard":
                dc.drawLine(x_mid-radius,y_mid, x_mid+radius,y_mid);
                dc.drawLine(x_mid,y_mid, x_mid,y_mid+radius);
                dc.drawText(x_mid+radius, y_mid+(radius/4),
                            Graphics.FONT_TINY,
                            "Vegetables",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                dc.drawText(x_mid-(radius*2/3), y_mid+(radius/4),
                            Graphics.FONT_TINY,
                            "Protein",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                dc.drawText(x_mid, y_mid-(radius*3/4),
                            Graphics.FONT_TINY,
                            "Grains",
                            Graphics.TEXT_JUSTIFY_CENTER
                            );
                break;
        }
    }

}