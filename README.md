# GeometricActivityIndicator

[![CI Status](https://img.shields.io/travis/oct0f1sh/GeometricActivityIndicator.svg?style=flat)](https://travis-ci.org/oct0f1sh/GeometricActivityIndicator)
[![Version](https://img.shields.io/cocoapods/v/GeometricActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/GeometricActivityIndicator)
[![License](https://img.shields.io/cocoapods/l/GeometricActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/GeometricActivityIndicator)
[![Platform](https://img.shields.io/cocoapods/p/GeometricActivityIndicator.svg?style=flat)](https://cocoapods.org/pods/GeometricActivityIndicator)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Animations

The animations included in GeometricActivityIndicator are based upon [Metatron's Solids/Sacred Geometry](http://3rddimension.online.fr/metatron_cube.htm).

![shapes](https://media.giphy.com/media/xiNGSBSQ3CWceNyOVW/giphy.gif)

## Usage

### Storyboard

Implementing GeometricActivityIndicator in your project is as setting a custom class for a UIView. Many of the properties are editable using the Attributes Inspector. 

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

__Important:__ GeometricActivityIndicator is a subclass of UIView, not UIActivityIndicatorView, make sure you set the custom class for the correct element. 

### Programmatically

```swift
class ViewController: UIViewController {
    var geometricView: GeometricActivityIndicator!

    override func viewDidLoad() {
        geometricView = GeometricActivityIndicator(frame: CGRect(x: 0, y: 0, width: 250, height: 250))

        geometricView.startAnimating()
    }

    @IBAction func stopButtonTapped(_ sender: Any) {
        geometricView.stopAnimating()
    }
}
```

## Customization

### Changing Animation Timing

#### Changing Duration
```swift
// changes the stencil animation duration to 3 seconds
geometricView.stencilAnimDuration = 3
```

```swift
// changes the shape animation duration to 5 seconds
geometricView.shapeAnimDuration = 5
```

#### Changing Animation Timing
```swift
// changes stencil animation and shape animation to start and end at the same time with a duration of 3 seconds
geometricView.stencilAnimDuration = 3
geometricView.stencilAnimFromValue = 0
geometricView.stencilAnimToValue = 1

geometricView.shapeAnimDuration = 3
geometricView.shapeAnimFromValue = 0
geometricView.shapeAnimToValue = 1
```

```swift
// this is the default duration and timing for the stencil and shape animations
// note: these are the default values when creating a GeometricActivityIndicator.
//       these values produce the animations shown above
geometricView.stencilAnimDuration = 1.5
geometricView.stencilAnimFromValue = -0.5
geometricView.stencilAnimToValue = 2

geometricView.shapeAnimDuration = 1.5
geometricView.shapeAnimFromValue = -2
geometricView.shapeAnimToValue = 1.5
```

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
