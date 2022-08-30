# 03. The Delegate Pattern

In this chapter, the delegate design pattern is introduced, which is used by many of the most commons views in UIKit, such as text views, pickers, tables, and collections. Delegates are used to make important connections between model views and controllers.

## The TextFields App

![The home screen of the TextFields app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/textfields-app-filled.png)

To practice the concepts learned in this chapter, we've coded the TextFields app — an application consisting of three text fields — each decorates its input text on a particular way. We used delegates to create customized behaviors for each text field using just one view.

- The first text field turns words into emojis. Tapping on the this text field will clear any text, so it's not possible to edit existing text within this field. Also, tapping on the Return key won't hide the kayboard.
- The second one sets the text color to be a combination of the colors within the text.
- Finally, the third text field displays a label that shows the character count as typing.

I also added an "Instructions" view that shows the instructions for the app, as shown below. It can be accesed by tapping the "How does it work?" button on the home screen. It is a view that is shown modally and can be dismissed via the "Go Back" button.

![The Instructions screen of the TextFields app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/textfields-app-instructions.png)

### The app's object diagram

Here's the app's object diagram, representing the relationship between the classes and objects that are part of the application.

![An object diagram of the TextFields app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/textfields-app-object-diagram.png)

## The Challenge App

![The home screen of the TextFields app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/textfields-challenge-app-home.png)

The challenge app is similar to the Text Fields app, but the fields respond differently.

- The first field is a "Zip Code" field. It is a text field that only allows numbers to be entered. It has a limit of 5 characters, ignoring any further input.
- The second field is a "Currency" field. Similar to the "Zip Code" field, it only allows numbers to be entered. It has a limit of 24 characters, ignoring any further input. It formats the inputted text to be a currency value, displaying the currency symbol and the decimal separator, with the number of decimal places set to 2.
- The third field is an ordinary text field whose "editability" is determined by a switch next to it. If the switch is on, the field is editable. If the switch is off, the field is not editable.

![The home screen of the TextFields app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/textfields-challenge-app-filled.png)
