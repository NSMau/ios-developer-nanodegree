UIKit Fundamentals

This modules introduces UIKit, a library of built-in UI components provided by Apple. A few apps are coded to grasp and practice the fundamentals of UIKit.

## The Click Counter App

![Screenshot of the Click Counter app in portrait mode](https://raw.githubusercontent.com/NSMau/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/click-counter-app-screenshot-portrait.png)

![Screenshot of the Click Counter app in landscape mode](https://raw.githubusercontent.com/NSMau/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/click-counter-app-screenshot-landscape.png)

This is a very simple app which consists of one label to display the count result and three buttons to reset the counter to zero, increment it, or decrement it.

Here's a diagramm of the app's architecture.

![Diagramm of the Click Counter app's architecture](https://raw.githubusercontent.com/NSMau/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/click-counter-app-architecture-diagramm.png)

The objects are represented as a rectangle and the object properties are represented as circles. The objects that render the view are shown in blue. When the user taps on a button, the button interprets it as an event, which invokes an action on the ViewController, which ultimately updates the model and the view to reflect the changes.

## The Color Maker App

![Screenshot of the ColorMaker app](https://raw.githubusercontent.com/NSMau/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/color-maker-app-screenshot.png)

A simple app to play with UISwitches. It implements three toggles to turn on/off red, green, and blue components to make the background color of a view that acts as the overall background color. This color will vary depending on the status of the toggles.

## The Color Maker App v2

![Screenshot of the ColorMaker v2 app](https://raw.githubusercontent.com/NSMau/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/color-maker-2-app-screenshot.png)

This is an improved version of the previous app that uses sliders (instead of switches) to select rgb values, which results in a much wider gamut of colors for the background view color.

## The MemeMe App

The app lets you choose an image from your phone, add text to it, and share it with friends. It stores the meme in a collection of meme model objects, and can be browsed with a table view or as a grid. The app is built on top of standard UIKit components.
