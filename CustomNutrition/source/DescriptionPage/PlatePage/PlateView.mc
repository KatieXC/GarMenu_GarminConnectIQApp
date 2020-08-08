/* File: PlatePageView, getTypeOfDay, getBMR */
using Toybox.WatchUi;
using Toybox.Graphics;
using Toybox.UserProfile;
using Toybox.ActivityMonitor;
using Toybox.Time;
using Toybox.Time.Gregorian;
using Toybox.System;

//-------------- Plate Page View --------------//
class PlatePageView extends WatchUi.View {

    var dayType;            // User's day type {Easy, Medium, Hard}
    var plate;              // PlateDrawable

    function initialize() {
        View.initialize();
        dayType = getTypeOfDay();               // Use helper function to determine user day type
        plate = new PlateDrawable(dayType);     // Create appropriate drawable
    }

    // Use general plate layout created in .xml file
    function onLayout(dc) {
        setLayout(Rez.Layouts.PlatePageLayout(dc));
    }

    function onShow() {
    }

    // Redraw screen & plate
    function onUpdate(dc) {
        View.onUpdate(dc);
        plate.draw(dc);
    }

    function onHide() {
    }

}

//----- Basal Metabolic Rate Calculation ------//
//  Input: age(years), height(cm), weight(kg), gender(int)
//  Output: bmr(kCal)
function getBMR(age, height, weight, gender) {
    var bmr = 0;

    // Use Harris-Benedict BMR equation
    if (gender == UserProfile.GENDER_FEMALE) {
        bmr = (447.593) + (9.247*weight) + (3.098*height) - (4.330*age);
    }
    else if (gender == UserProfile.GENDER_MALE) {
        bmr = (88.362) + (13.397*weight) + (4.799*height) - (5.677*age);
    }
    return bmr;
}


//---- Determine Day Type Helper Function -----//
//  Output: day type(Easy, Moderate, Hard)
function getTypeOfDay() {
    // Date & Time Variables
    var today = Gregorian.info(Time.now(), Time.FORMAT_MEDIUM);
    var curYear = today.year;                       // Current year
    var curHour = today.hour + 1;                   // Current hour of day (24hr)

    // User Variables
    var info = ActivityMonitor.getInfo();           // Get user's current day info
    var userCals = info.calories;                   // Calories burned so far -- kCal
        // System.println("userCals: "+userCals);
    var profile = UserProfile.getProfile();         // Get user profile
    var userAge = 25;                               // Using random avg info (25yo female, 5'4", 154lbs)
    var userHeight = 162;
    var userWeight = 70;
    var userGender = UserProfile.GENDER_FEMALE;
    if (profile != null) {
        userAge = curYear - profile.birthYear;      // Age    -- years passed
        userHeight = profile.height;                // Height -- cm
        userWeight = profile.weight / 1000;         // Weight -- g to kg
        userGender = profile.gender;                // Gender -- F/M
    }

    // Calculated Variables
    var bmr = getBMR(userAge, userHeight, userWeight, userGender); // BMR
    var relativeBMR = bmr * (curHour/24.0);         // BMR at current time of day
    var ratioCals = userCals / relativeBMR;         // Ratio of actual to predicted calories burned so far
        // System.println("BMR: "+bmr);
        // System.print(userCals+" / "+relativeBMR);
        // System.println(" = "+ratioCals);

    // Set cutoffs to compare to ratioCals
    var easyModCutoff = 1.30;
    var modHardCutoff = 1.80;

    // Return effort for day
    if (ratioCals > modHardCutoff) {
        System.println("Hard day");
        return "Hard";
    }
    else if (ratioCals > easyModCutoff) {
        System.println("Moderate day");
        return "Moderate";
    }
    else {
        System.println("Easy day");
        return "Easy";
    }
}