//
//  ViewControllerSpec.swift
//  OutletsExample
//
//  Created by Ben Chatelain on 5/1/16.
//  Copyright © 2016 Ben Chatelain. All rights reserved.
//

import Foundation

@testable import OutletsExample
import Quick
import Nimble

class ViewControllerSpec: QuickSpec {
	override func spec() {
		var viewController: UIViewController!

		var hasBarButtonItemOutlet: BarButtonItemOutletAssertion!
		var hasSegmentedControlOutlet: SegmentedControlOutletAssertion!
		var receivesAction: ActionAssertion!

		describe("view controller") {
			beforeEach {
				viewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("ViewController")
				viewController.loadView()
				expect(viewController.view).toNot(beNil())

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
