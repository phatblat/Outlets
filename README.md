# Outlets

[![Build Status](https://travis-ci.org/phatblat/Outlets.svg?branch=master)](https://travis-ci.org/phatblat/Outlets)
[![Version](https://img.shields.io/cocoapods/v/Outlets.svg?style=flat)](http://cocoapods.org/pods/Outlets)
[![License](https://img.shields.io/cocoapods/l/Outlets.svg?style=flat)](http://cocoapods.org/pods/Outlets)
[![Platform](https://img.shields.io/cocoapods/p/Outlets.svg?style=flat)](http://cocoapods.org/pods/Outlets)

Utility functions for validating IBOutlet and IBAction connections.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

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

## Requirements

- Xcode 7.3+
- CocoaPods 0.39+

## Installation

Outlets is available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "Outlets"
```

## Author

Ben Chatelain, [@phatblat](https://twitter.com/phatblat)

## License

This repo is licensed under the MIT License. See the [LICENSE](LICENSE.md) file for rights and limitations.
