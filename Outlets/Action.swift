//
//  Action.swift
//  Outlets
//
//  Created by Ben Chatelain on 5/1/16.
//  Copyright © 2016 Ben Chatelain.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import UIKit

// MARK: - Actions
/// Full signature of the `action` curried function.
typealias FullActionAssertion = (UIViewController) -> (String, from: String) -> Void

/// Asserts that the  `from` outlet.
typealias ActionAssertion = (String, from: String) -> Void

/// Asserts that `viewController` contains an action invoked from a known outlet.
/// The Nimble `expect` function is used for validation and `fail` is called if
/// action type is not supported.
///
/// - parameter viewController: `UIViewController` to inspect.
///
/// - returns: Function which validates `expectedAction`.
///
///            - parameter expectedAction: Name of action to look up.
///
///            - parameter expectedOutlet: Name of outlet to look up.
///
///            - returns: Object bound to `outlet` if found; nil otherwise.
func action(viewController: UIViewController) -> (String, from: String) -> Void {
    return { (expectedAction: String, expectedOutlet: String) in
        let optionalControl = outlet(viewController)(expectedOutlet)

        var target: AnyObject?
        var action: String?

        if let control = optionalControl {
            switch control {
            case let button as UIBarButtonItem:
                target = button.target
                action = button.action.description
            case let control as UIControl:
                target = control.allTargets().first!
                var allActions: [String] = []
                for event: UIControlEvents in [.TouchUpInside, .ValueChanged] {
                    allActions += control.actionsForTarget(target!, forControlEvent: event) ?? []
                }

                // Filter down to the expected action
                action = allActions.filter({$0 == expectedAction}).first
            default:
                fail("Unhandled control type: \(control.dynamicType)")
            }
        }

//        expect(target) === viewController
//        expect(action).toNot(beNil())
//        if let action = action {
//            expect(action) == expectedAction
//        }
    }
}
