//
//  EventView.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class ProfileView: UIView {
	
	fileprivate lazy var testLabel: UILabel = {
		var testLabel = UILabel()
		testLabel.text = "Test"
		self.addSubview(testLabel)
		testLabel.center = self.center
		return testLabel
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
	}
}
