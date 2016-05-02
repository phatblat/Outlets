//
//  ViewController.swift
//  OutletsPod
//
//  Created by Ben Chatelain on 05/01/2016.
//  Copyright (c) 2016 Ben Chatelain. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	@IBOutlet var leftButton: UIBarButtonItem!
	@IBOutlet var rightButton: UIBarButtonItem!
	@IBOutlet var segmentedControl: UISegmentedControl!
}

// MARK: - IBAction Methods
extension ViewController {
	@IBAction func didTapLeftButton(button: UIBarButtonItem) {
		print("didTapLeftButton:")
	}

	@IBAction func didTapRightButton(button: UIBarButtonItem) {
		print("didTapRightButton:")
	}

	@IBAction func segmentedControlValueDidChange(segmentedControl: UISegmentedControl) {
		print("segmentedControlValueDidChange:")
	}
}

