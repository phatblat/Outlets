//
//  Validation.swift
//  Outlets
//
//  Created by Ben Chatelain on 5/1/16.
//  Copyright © 2016 Ben Chatelain. All rights reserved.
//

// MARK: - Failure Handling

/// Closure called when a test has failed. Used to map to testing framework's
/// fail function.
public typealias FailHandler = (String?) -> Void

private var failHandler: FailHandler?

/// Stores the given `FailHandler` for use when a built-in validation fails.
/// Example of calling this with trailing closure syntax and mapping to the
/// Nimble `fail` function:
///
///     setupFailHandler { message in
///         if let message = message {
///             fail(message)
///         } else {
///             fail()
///         }
///     }
///
/// - parameter handler: Optional `FailHandler` to handle failures.
public func setupFailHandler(_ handler: FailHandler?) {
    failHandler = handler
}

/// Passthrough function which calls the `FailHandler` provided by the caller.
/// This allows for tests to call XCTFail() or Nimble's fail() function without
/// any knowledge or dependencies in this framework.
///
/// - parameter message: Optional description of failure.
func fail(_ message: String?) {
    guard let handler = failHandler else { print("ERROR: failHandler has not been set up."); return }
    handler(message)
}

// MARK: - Action Validation
public typealias ActionValidation = (target: AnyObject?, action: String?, expectedAction: String) -> Void

private var actionValidator: ActionValidation?

/// Stores the given `ActionValidation` for use in validating IBAction methods.
/// Example of calling this with trailing closure syntax and mapping to the
/// Nimble `expect` function:
///
///     setupActionValidator { target, action, expectedAction in
///         expect(target) === viewController
///         expect(action).toNot(beNil())
///         if let action = action {
///             expect(action) == expectedAction
///         }
///     }
///
/// - parameter validator: Optional `ActionValidation` to perform validation.
/// - Note: The `validator` should be passed the same `UIViewController` instance that will be
///         used in your tests. If you reinitialize this for each text/example method (e.g. in
///         `setUp` or `beforeEach`) you will need to call `setupActionValidator` again with
///         the new instance.
public func setupActionValidator(_ validator: ActionValidation?) {
    actionValidator = validator
}

/// Passthrough function which calls the `ActionValidation` provided by the caller.
///
/// - parameter target:         Target of the action, expected to be the given view controller.
/// - parameter action:         Action found (will be nil if not found).
/// - parameter expectedAction: String name of expected action.
func validate(target: AnyObject?, action: String?, expectedAction: String) {
    guard let validator = actionValidator else { print("ERROR: actionValidator has not been set up."); return }
    validator(target: target, action: action, expectedAction: expectedAction)
}
