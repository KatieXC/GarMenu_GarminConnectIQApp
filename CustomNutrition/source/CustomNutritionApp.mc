/* File: CustomNutritionApp */
using Toybox.Application;
using Toybox.WatchUi;
using Toybox.Math;
using Toybox.System;

public var index;           // Index for recipe selection

//----------- Application Top Level -----------//
class CustomNutritionApp extends Application.AppBase {

    function initialize() {
        AppBase.initialize();
    }

    // onStart() is called on application start up
    function onStart(state) {
        index = Math.rand() % 3;        // Set to random index [0-2]
        // System.println(index);
    }

    // onStop() is called when your application is exiting
    function onStop(state) {
    }

    // Return the initial view of your application here
    function getInitialView() {
        return [ new CustomNutritionView(), new CustomNutritionDelegate() ];
    }

}
