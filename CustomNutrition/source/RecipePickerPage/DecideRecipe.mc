using Toybox.Graphics;
using Toybox.WatchUi;
using Toybox.System;

//---------- All Recipe Titles -----------//
var be_titles = [Rez.Strings.BE_1T, Rez.Strings.BE_2T, Rez.Strings.BE_3T];
var bm_titles = [Rez.Strings.BM_1T, Rez.Strings.BM_2T, Rez.Strings.BM_3T];
var bh_titles = [Rez.Strings.BH_1T, Rez.Strings.BH_2T, Rez.Strings.BH_3T];

var le_titles = [Rez.Strings.LE_1T, Rez.Strings.LE_2T, Rez.Strings.LE_3T];
var lm_titles = [Rez.Strings.LM_1T, Rez.Strings.LM_2T, Rez.Strings.LM_3T];
var lh_titles = [Rez.Strings.LH_1T, Rez.Strings.LH_2T, Rez.Strings.LH_3T];

var se_titles = [Rez.Strings.SE_1T, Rez.Strings.SE_2T, Rez.Strings.SE_3T];
var sm_titles = [Rez.Strings.SM_1T, Rez.Strings.SM_2T, Rez.Strings.SM_3T];
var sh_titles = [Rez.Strings.SH_1T, Rez.Strings.SH_2T, Rez.Strings.SH_3T];

var titles = [[be_titles, bm_titles, bh_titles],
              [le_titles, lm_titles, lh_titles],
              [se_titles, sm_titles, sh_titles]];

//------- All Recipe Descriptions --------//
var be_desc = [Rez.Strings.BE_1D, Rez.Strings.BE_2D, Rez.Strings.BE_3D];
var bm_desc = [Rez.Strings.BM_1D, Rez.Strings.BM_2D, Rez.Strings.BM_3D];
var bh_desc = [Rez.Strings.BH_1D, Rez.Strings.BH_2D, Rez.Strings.BH_3D];

var le_desc = [Rez.Strings.LE_1D, Rez.Strings.LE_2D, Rez.Strings.LE_3D];
var lm_desc = [Rez.Strings.LM_1D, Rez.Strings.LM_2D, Rez.Strings.LM_3D];
var lh_desc = [Rez.Strings.LH_1D, Rez.Strings.LH_2D, Rez.Strings.LH_3D];

var se_desc = [Rez.Strings.SE_1D, Rez.Strings.SE_2D, Rez.Strings.SE_3D];
var sm_desc = [Rez.Strings.SM_1D, Rez.Strings.SM_2D, Rez.Strings.SM_3D];
var sh_desc = [Rez.Strings.SH_1D, Rez.Strings.SH_2D, Rez.Strings.SH_3D];

var descriptions = [[be_desc, bm_desc, bh_desc],
                    [le_desc, lm_desc, lh_desc],
                    [se_desc, sm_desc, sh_desc]];


//----- Decide Recipe Helper Function ----//
function getRecipe(meal_s, day_s) {

    // Set recipe array indices
    var meal = meal_s.equals(WatchUi.loadResource(Rez.Strings.meal_option1))?0 :
               meal_s.equals(WatchUi.loadResource(Rez.Strings.meal_option2))?1 :
               2;
    var day = day_s.equals(WatchUi.loadResource(Rez.Strings.nutrition_option1))?0 :
              day_s.equals(WatchUi.loadResource(Rez.Strings.nutrition_option2))?1 :
              2;
    // System.println("meal: "+meal_s+", "+meal);       // Fer de bug
    // System.println("day: "+day_s+", "+day);
    // System.println("index: "+$.index);

    // Access recipe title & description
    var t = titles[meal][day][$.index];
    var d = descriptions[meal][day][$.index];
    
    // Increment index for next recipe
    $.index = ($.index+1) % 3;
    
    // Create custon recipe view
    return new RecipeView(WatchUi.loadResource(t), WatchUi.loadResource(d));
}
