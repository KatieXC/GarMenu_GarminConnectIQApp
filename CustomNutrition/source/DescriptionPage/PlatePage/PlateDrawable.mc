/* File: plate_color, PlateDrawable */
using Toybox.WatchUi;
using Toybox.Graphics;

//--------------- Color Themes ----------------//
var plate_color = {"Easy"=>     Graphics.COLOR_BLUE,
                   "Moderate"=> Graphics.COLOR_GREEN,
                   "Hard"=>     Graphics.COLOR_RED};

//-------------- Plate Drawable ---------------//
class PlateDrawable extends WatchUi.Drawable {

    var day;                // Type of day

    function initialize(d) {
        Drawable.initialize({});
        day = d;
    }

    // Draw header and correct plate w/ divisions & labels
    function draw(dc) {
        // Plate's center coordinates & radius
        var x_mid = dc.getWidth()/2;
        var y_mid = dc.getHeight()/2 + dc.getFontHeight(Graphics.FONT_XTINY) + 5;
        var radius = dc.getHeight()/4;

        // Draw day header above plate
        dc.setColor(plate_color[day], Graphics.COLOR_TRANSPARENT);
        dc.drawText(x_mid, y_mid - (radius+dc.getFontHeight(Graphics.FONT_SMALL) + 5),
                    Graphics.FONT_SMALL,
                    day+" Day",
                    Graphics.TEXT_JUSTIFY_CENTER
                    );

        // Draw day's plate
        dc.fillCircle(x_mid, y_mid, radius);
        dc.setColor(Graphics.COLOR_WHITE, Graphics.COLOR_TRANSPARENT);
        dc.setPenWidth(3);
        switch(day) {
            case "Easy":
                dc.drawLine(x_mid-radius,y_mid, x_mid,y_mid);           // Grains/Protein Line
                dc.drawLine(x_mid,y_mid-radius, x_mid,y_mid+radius);    // Vegetables Line
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
                dc.drawLine(x_mid-radius,y_mid, x_mid,y_mid);           // Grains/Protein Line
                dc.drawLine(x_mid,y_mid, x_mid,y_mid+radius);           // Vegetable/Protein Line
                dc.drawLine(x_mid,y_mid, x_mid+(radius/1.4),y_mid-(radius/1.4)); // Grains/Vegetable Line
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
                dc.drawLine(x_mid-radius,y_mid, x_mid+radius,y_mid);    // Grains Line
                dc.drawLine(x_mid,y_mid, x_mid,y_mid+radius);           // Protein/Vegetable Line
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