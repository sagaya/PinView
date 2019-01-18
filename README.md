# PinView

[![CI Status](https://img.shields.io/travis/sagaya/PinEntryField.svg?style=flat)](https://travis-ci.org/sagaya/PinEntryField)
[![Version](https://img.shields.io/cocoapods/v/PinEntryField.svg?style=flat)](https://cocoapods.org/pods/PinEntryField)
[![License](https://img.shields.io/cocoapods/l/PinEntryField.svg?style=flat)](https://cocoapods.org/pods/PinEntryField)
[![Platform](https://img.shields.io/cocoapods/p/PinEntryField.svg?style=flat)](https://cocoapods.org/pods/PinEntryField)

![](screenshot.gif)

## About

This project gives you a passcode control that can be dropped into any iOS app. It behaves exactly like the passcode screens that can be seen by going to Settings > General > Passcode Lock.

## Features

- Native iOS look and feel
- Masks pin entry with bullet characters (If you want a secured entry)
- Easily customizable 
- Provide custom text to be displayed on the passcode entry view
- Block-based passcode verification


## Installation

PinView is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'PinEntryField'
```
### Manual Installation
```
Drag the PinView file into your project and voilà
```

## Create a new passcode
```swift
import PinView
```
Create the view inside `viewDidLoad`

```swift
let passcodeView = CodeView(numberOfPin: 4, codeStyle: .line)
passcodeView.isSecureTextEntry = true
//Conform to the protocol `PinInputDelegate` so you will know when the pin entery has been completed
passcodeView.delegate = self
passcodeView.frame = ??
//Yea that is all you have to do!!
```
The only extra protcol stub is 

```swift
func didFinishInput(_ inputView: CodeView, didFinishWith text: String) {
    print(text)
}
```


## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Customization

| Attribute | Description |
| --- | --- |
| isSecureTextEntry | Just like it says (secure entry) it will mask out the text |
| boxSize | Custom size for the boxes of type CGSize |
| codeStyle | Three different Styles (rounded,square,line) |
| spacing |  Custom line spacing between each box |
| activeFieldColor | background color of the box when the text has been set (defaults to black) |
| backgroundClr |  A background color that for the boxes that will always be there, just like the first example |
| font |  Custom Font for the text |
| textColor |  Text Color for the text |
| keyboardType |  Change the type of keyboard (Defaults to numberPad) |


### Inspired by [PinView](https://github.com/ChaosLeong/PinView) for Android 

## Author

sagaya, shaggy.hafeez@gmail.com

## License

PinView is available under the MIT license. See the LICENSE file for more info.
