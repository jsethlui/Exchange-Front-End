//
//  ViewController.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

	override func viewDidLoad() {
		// Do any additional setup after loading the view.
		super.viewDidLoad()
		
		// creating button
//		var aButton = CustomButton(value: 1000)
//		aButton.setTitle("Test", for: .normal)
//
//		// adding button + setting auto layout
//		aButton.translatesAutoresizingMaskIntoConstraints = false
//		self.view.addSubview(aButton)
//		aButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//        aButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
//
//		print(aButton.value)
		
		let view = EventView()
		self.view.addSubview(view)
	}

}

