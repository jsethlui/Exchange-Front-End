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
		
		let view = EventView()
		self.view.addSubview(view)
	}

}

