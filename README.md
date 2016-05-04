![Outlets logo](http://phatbl.at/images/outlets-logo.png "Outlets logo showing electrical sockets from various contries")

# Outlets

_Utility functions for validating `IBOutlet` and `IBAction` connections._

[![Version](https://img.shields.io/cocoapods/v/Outlets.svg?style=flat)](http://cocoapods.org/pods/Outlets)
[![License](https://img.shields.io/cocoapods/l/Outlets.svg?style=flat)](http://cocoapods.org/pods/Outlets)
[![Platform](https://img.shields.io/cocoapods/p/Outlets.svg?style=flat)](http://cocoapods.org/pods/Outlets)
[![Build Status](https://travis-ci.org/phatblat/Outlets.svg?branch=master)](https://travis-ci.org/phatblat/Outlets)
[![codecov](https://codecov.io/gh/phatblat/Outlets/branch/master/graph/badge.svg)](https://codecov.io/gh/phatblat/Outlets)

# About

Outlets provides a set of functions which validate that `IBOutlets` are
correctly connected between your Storyboard/XIB file and view controller properties. It
can also validate that `IBAction` methods are connected correctly as well.

> This micro-library is based on the following post:
> [Testing IBOutlets and IBActions With Curried Functions in Swift](http://phatbl.at/2016/04/29/testing-iboutlets-and-ibactions-with-curried-functions-in-swift.html)


## Requirements

- Xcode 7.3+
- Swift 2.2+
- iOS 8.0+

## Installation

### [CocoaPods](http://cocoapods.org) (recommended)

```ruby
use_frameworks!
pod 'Outlets'
```

### [Carthage](https://github.com/Carthage/Carthage)

```
github "phatblat/Outlets"
```

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

Or run `pod try Outlets` from the command line.

## Getting Started

Here is an example of using Outlets with Quick and Nimble:

```swift
class ViewControllerSpec: QuickSpec {
	override func spec() {
        setupFailHandler { message in
            if let message = message {
                fail(message)
            } else {
                fail()
            }
        }

		var viewController: UIViewController!

		var hasBarButtonItemOutlet: BarButtonItemOutletAssertion!
		var hasSegmentedControlOutlet: SegmentedControlOutletAssertion!
		var receivesAction: ActionAssertion!

		describe("view controller") {
			beforeEach {
				viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController")
				viewController.loadView()
				expect(viewController.view).toNot(beNil())

                setupActionValidator { target, action, expectedAction in
                    expect(target) === viewController
                    expect(action).toNot(beNil())
                    if let action = action {
                        expect(action) == expectedAction
                    }
                }

				// Capture the new viewController instance for each test
				hasBarButtonItemOutlet = outlet(viewController)
				hasSegmentedControlOutlet = outlet(viewController)
				receivesAction = action(viewController)
			}

			// MARK: - Outlets
			it("has a leftButton outlet") {
				hasBarButtonItemOutlet("leftButton")
			}
			it("has a rightButton outlet") {
				hasBarButtonItemOutlet("rightButton")
			}
			it("has a segmentedControl outlet") {
				hasSegmentedControlOutlet("segmentedControl")
			}

			// MARK: - Actions
			it("receives a didTapLeftButton: action from leftButton") {
				receivesAction("didTapLeftButton:", from: "leftButton")
			}
			it("receives a didTapRightButton: action from rightButton") {
				receivesAction("didTapRightButton:", from: "rightButton")
			}
			it("receives a segmentedControlValueDidChange: action from segmentedControl") {
				receivesAction("segmentedControlValueDidChange:", from: "segmentedControl")
			}
		}
	}
}
```

## Author

Ben Chatelain, [@phatblat](https://twitter.com/phatblat)

## License

`Outlets` is released under the [MIT License](http://opensource.org/licenses/MIT). See the [LICENSE](LICENSE.md) file for details.
