# The MemeMe App

This is the code of the version 1.0 of MemeMe, an iOS app that allows you to create a meme and share with your friends. MemeMe is part of the **UIKit Fundamentals** section of the **Udacity's iOS Developer Nanodegree**.

The app allows you to select an image from the camera Photo Album or take a picture with the camera and add text to the top and bottom of the image to convert it into a meme. After making a meme, you can share it with your friends.

## Implementation Details

MemeMe v1.0 has two view controller scenes:

- `HomeViewController` — This is the main view of the app. It displays an empty state (since no memes have been created) with a toolbar at the bottom. The toolbar contains two buttons, labelled **Photo Library** and **Camera**, one for the photo album and the camera respectively. Tapping either of these buttons presents the `ImagePickerViewController` modally. After selecting an image, it gets passed to the `MemeEditorViewController`, which is presented modally.

- `MemeEditorViewController` — Here, the user can add text to the top and bottom of the image selected. There is a navgation bar with two button, **Cancel** and **Done**. Tapping **Cancel** promtps the user to confirm that they want to cancel the meme creation. Tapping **Done** presents a `UIActivityViewController` with options to share the meme. In case the user taps **Done** without adding any text, the app displays an alert to the user.

## Screens of the App

### Launch Screen

The launch screen displays the app's logo and name as well as the version number.

![Launch screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-launch-screen.png)

### Home

![Home screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-home.png)

### Image Picker

iOS's built-in `UIImagePickerController` is used to select an image from the camera Photo Album or take a picture with the camera.

![Image picker screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-image-picker.png)

### Meme Editor

The chosen image is displayed with default text at the top and bottom. The user can edit the text.

![Meme editor screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-editor.png)

### Cancelling Meme Alert

![Cancelling meme alert screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-cancel-alert.png)

### Missing Text Alert

An alert is displayed to the user if they try to share a meme without adding any text.

![Missing text alert screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-missing-text-alert.png)

### Move View Up When Keyboard Appears

The view is moved up when the keyboard appears to edit the bottom text field.

![Move view up when keyboard appears screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-move-view-up.png)

### Meme Sharing

![Meme sharing screen of the MemeMe app](https://raw.githubusercontent.com/patternina/ios-developer-nanodegree/main/UIKit%20Fundamentals/images/mememe-1.0-sharing-options.png)

## Requirements

- Xcode 13.4.1

- Swift 5.0

## License

Copyright (c) 2022 Mauricio Paternina.

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
