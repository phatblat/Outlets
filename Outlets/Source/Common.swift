//
//  Common.swift
//  Outlets
//
//  Created by Ben Chatelain on 5/1/16.
//  Copyright © 2016 Ben Chatelain. All rights reserved.
//

/// Closure called when a test has failed. Used to map to testing framework's
/// fail function.
public typealias FailHandler = String? -> Void

private var failHandler: FailHandler?

public func setupFailHandler(handler: FailHandler?) {
    failHandler = handler
}

/// No-op function which will eventually be mapped to Nimble fail()
/// or XCTFail() (can this be done dynamically?)
///
/// - parameter message: Description of failure.
func fail(message: String?) {
    guard let handler = failHandler else { print("ERROR: failHandler has not been set up"); return }
    handler(message)
}
