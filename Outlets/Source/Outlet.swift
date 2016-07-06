//
//  Outlet.swift
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

// MARK: - Outlets
/// Full signature of the `outlet` curried function.
private typealias FullOutletTest = (UIViewController) -> (String) -> AnyObject?

/// Asserts that the named outlet is bound, but does not care about the type of object.
typealias AnyOutletAssertion = (String) -> AnyObject?

/// Asserts that the named outlet is bound to a `UIButton`.
typealias ButtonOutletAssertion = (String) -> UIButton?

/// Asserts that the named outlet is bound to a `UIBarButtonItem`.
public typealias BarButtonItemOutletAssertion = (String) -> UIBarButtonItem?

/// Asserts that the named outlet is bound to a `UISegmentedControl`.
public typealias SegmentedControlOutletAssertion = (String) -> UISegmentedControl?

/// Asserts that the named outlet is bound to a `UILabel`.
typealias LabelOutletAssertion = (String) -> UILabel?

/// Asserts that the named outlet is bound to a `UIImageView`.
typealias ImageOutletAssertion = (String) -> UIImageView?

/// Asserts that `viewController` has an outlet with matching name. The Nimble
/// `fail` function is called if outlet is not found.
///
/// - parameter viewController: `UIViewController` to inspect.
///
/// - returns: Function which validates `outlet`.
///
///            - parameter outlet: Name of outlet to look up.
///
///            - returns: Object bound to `outlet` if found; nil otherwise.
///
/// - note: Does not need an explicit call to test framework fail as runtime will catch exception:
///         Assertions: failed: caught "NSUnknownKeyException", "[<OutletsExample.ViewController 0x7fa400c47750> valueForUndefinedKey:]: this class is not key value coding-compliant for the key leftButton1."
func outlet(_ viewController: UIViewController) -> (String) -> AnyObject? {
    return { (outlet: String) -> AnyObject? in
        guard let object = viewController.value(forKey: outlet)
            else { return nil }

        return object
    }
}

/// Asserts that `viewController` has an outlet with matching name. The Nimble
/// `fail` function is called if outlet is not found.
///
/// - parameter viewController: `UIViewController` to inspect.
///
/// - returns: Function which validates `outlet`.
///
///            - parameter outlet: Name of outlet to look up.
///
///            - returns: Object bound to `outlet` if found; nil otherwise.
public func outlet<T>(_ viewController: UIViewController) -> (String) -> T? {
    return { (expectedOutlet: String) -> T? in
        guard let object = outlet(viewController)(expectedOutlet)
            else { return nil }

        debugPrint(object.dynamicType)

        guard let objectOfType = object as? T
            else { fail("\(object) outlet was not a \(T.self)"); return nil }

        return objectOfType
    }
}
