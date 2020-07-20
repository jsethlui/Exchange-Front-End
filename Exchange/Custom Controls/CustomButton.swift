//
//  CustomButton.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class CustomButton: UIButton {
	
	var value: Int
	var i = 0
	
	required init(value: Int = 0) {
		self.value = value
		super.init(frame: .zero)
		backgroundColor = .red
		self.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}

	@objc func buttonPrintOutput() {
		print("Pressed")
	}
	
	@objc func buttonTapped() -> Void {
		i += 1
		switch i {
			case 1:
				let generator = UINotificationFeedbackGenerator()
				generator.notificationOccurred(.error)
			case 2:
				let generator = UINotificationFeedbackGenerator()
				generator.notificationOccurred(.success)
			case 3:
				let generator = UINotificationFeedbackGenerator()
				generator.notificationOccurred(.warning)
			case 4:
				let generator = UIImpactFeedbackGenerator(style: .light)
				generator.impactOccurred()
			case 5:
				let generator = UIImpactFeedbackGenerator(style: .medium)
				generator.impactOccurred()
			case 6:
				let generator = UIImpactFeedbackGenerator(style: .heavy)
				generator.impactOccurred()
			default:
				let generator = UISelectionFeedbackGenerator()
				generator.selectionChanged()
				i = 0
			}
		print("i: \(i)")
		}
}
