# GeometricActivityIndicator

[![CI Status](https://img.shields.io/travis/oct0f1sh/GeometricActivityIndicator.svg?style=flat)](https://travis-ci.org/oct0f1sh/GeometricActivityIndicator)
[![Version](https://img.shields.io/cocoapods/v/GeometricActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/GeometricActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/GeometricActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/GeometricActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/GeometricActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/GeometricActivityIndicator)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Animations

The animations included in GeometricActivityIndicator are based upon [Metatron's Solids/Sacred Geometry](http://3rddimension.online.fr/metatron_cube.htm).
![shape 1](ReadmeAssets/shape1.gif "Shape 1") ![shape 2](ReadmeAssets/shape2.gif "Shape 2") ![shape 3](ReadmeAssets/shape3.gif "Shape 3")
![shape 4](ReadmeAssets/shape4.gif "Shape 4") ![shape 5](ReadmeAssets/shape5.gif "Shape 5") ![shape 6](ReadmeAssets/shape6.gif "Shape 6")

## Usage

### In Storyboard

![storyboard](https://media.giphy.com/media/7zlZ9tOBupkRFfHBcY/giphy.gif)

In your ViewController:
```swift
// create an IBOutlet for your new GeometricActivityIndicator
@IBOutlet weak var geometricView: GeometricActivityIndicator!

// now you can start / stop animating
override func viewDidLoad() {
    geometricView.startAnimating()
}

@IBAction func stopButtonTapped(_ sender: Any) {
    geometricView.stopAnimating()
}
```

__Important:__ GeometricActivityIndicator is a subclass of UIView, not UIActivityIndicatorView, make sure you set the custom class for the correct type. 

## Installation

GeometricActivityIndicator is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'GeometricActivityIndicator'
```

## Author

oct0f1sh, duncan@duncanmacdonald.us

## License

GeometricActivityIndicator is available under the MIT license. See the LICENSE file for more info.
