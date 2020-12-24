# **GarMenu**
*Garmin wearables application entry for Garmin's Connect IQ App Challenge July 2020  
By Katie Stapleton*

# Description
The goal of GarMenu is to help athletes learn to fuel properly with a healthy mindset.  The app provides the user with a plate layout custom to the effort of their activity that day and recipes for the different meals and effort days.
## Functionality
Once started, the initial page displays one of three possible plates (*Screenshots*).  Based on the user's calories burned in the day and the estimated resting calories burned, the day's effort is put into one of three categories: Easy, Moderate, & Hard.  The resting calorie estimate is calculated using the time of day and Harris-Benedict Basal Metabolic Rate (BMR) equation which takes into account the user's age, gender, height, & weight.  
If the select button is pressed, an about page comes up with a short descirption of where the recipes and plates come from.  
If the down button (next page) is pressed, the user selects options for a recipe.  The first menu (Menu2 object) is to decide the meal: breakfast, lunch, or dinner.  The second menu is to decide the effort: easy, moderate, or hard.  The recipe displayed contains the title, a short description, and the nutrition website for the US Olympic & Paralympic Committee (where the recipes were taken from).

## File Breakdown
* CustomNutrition: Eclipse workspace project folder
  * source: commented MonkeyC project files
  * resource: xml files with all images, strings, layouts, etc.  
* Screenshots: images of the app screens through the Connect IQ Simulation.

## Installing
Follow the SDK installation instructions in the Resources below to use the Connect IQ environment in Eclipse.  Once the project (CustomNutrition) has been uploaded, use the *Build for Device Wizard* under the *Connect IQ* menu to create a .prg file.  Copy this file to the APPS folder on your watch.

## Current Devices Supported
* Forerunner 245, 245 Music
* Vivoactive 4, 4S (1.2.0)
* Should compile for all devices with SDK version over 3.0. Few adjustments may be needed based on display and user interface

## Update 1.2.0 
*December 2020*  
The app is now compatable with the Vivoactive series. Improved description screen user interface.

# Resources
### Monkey C & Connect IQ
* [Garmin Connect IQ](https://developer.garmin.com/connect-iq/overview/)
* [Connect IQ Environment Installing Instructions](https://developer.garmin.com/connect-iq/programmers-guide/getting-started/)
* [Connect IQ SDK API Docs](https://developer.garmin.com/connect-iq/api-docs/)
* [Monkey C Programmer's Guid](https://developer.garmin.com/connect-iq/programmers-guide/)
* [Monkey C User's Guide](https://developer.garmin.com/connect-iq/user-experience-guide/)
* [Garmin Developer Forums](https://forums.garmin.com/developer/)
### Nutrition
* [United States Olympic Paralympic Committee Nutrition](https://www.teamusa.org/nutrition)
* [USOPC Cooking with Team USA - Recipes](https://www.teamusa.org/Cooking-With-Team-USA)
* [Harris-Benedict Equation](https://en.wikipedia.org/wiki/Harris%E2%80%93Benedict_equation)
* [Cambridge Study on BMR Equations](https://www.cambridge.org/core/journals/journal-of-nutritional-science/article/validity-of-predictive-equations-to-estimate-rmr-in-females-with-varying-bmi/9EB5881462F01C1082D52F5E78FAF691/core-reader#)
* [Garmin Calorie Calculations](https://support.garmin.com/en-US/?faq=mW8sEfEt3e4BFhwaqRioN6)
