//
//  Colors.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class Colors {
	var gl: CAGradientLayer!
	
	init() {
		let topColor = UIColor(red: 31.0 / 255.0, green: 27.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0).cgColor
		let bottomColor = UIColor(red: 18.0 / 255.0, green: 18.0 / 255.0, blue: 18.0 / 255.0, alpha: 1.0).cgColor
		
		self.gl = CAGradientLayer()
		self.gl.colors = [topColor, bottomColor]
		self.gl.locations = [0.0, 1.0]
	}
}
