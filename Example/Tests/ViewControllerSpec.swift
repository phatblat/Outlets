//
//  ViewControllerSpec.swift
//  OutletsExample
//
//  Created by Ben Chatelain on 5/1/16.
//  Copyright © 2016 Ben Chatelain. All rights reserved.
//

import Foundation

@testable import OutletsExample
import Outlets
import Quick
import Nimble

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
                viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewController")
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
				receivesAction("didTapLeftButton:", "leftButton")
			}
			it("receives a didTapRightButton: action from rightButton") {
				receivesAction("didTapRightButton:", "rightButton")
			}
			it("receives a segmentedControlValueDidChange: action from segmentedControl") {
				receivesAction("segmentedControlValueDidChange:", "segmentedControl")
			}
		}
	}
}
