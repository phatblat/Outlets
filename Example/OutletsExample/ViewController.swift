//
//  ViewController.swift
//  OutletsPod
//
//  Created by Ben Chatelain on 05/01/2016.
//  Copyright (c) 2016 Ben Chatelain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet fileprivate var leftButton: UIBarButtonItem!
	@IBOutlet fileprivate var rightButton: UIBarButtonItem!
	@IBOutlet fileprivate var segmentedControl: UISegmentedControl!
}

// MARK: - IBAction Methods
extension ViewController {
	@IBAction func didTapLeftButton(_ button: UIBarButtonItem) {
		print("didTapLeftButton:")
	}

	@IBAction func didTapRightButton(_ button: UIBarButtonItem) {
		print("didTapRightButton:")
	}

	@IBAction func segmentedControlValueDidChange(_ segmentedControl: UISegmentedControl) {
		print("segmentedControlValueDidChange:")
	}
}

