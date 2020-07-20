//
//  EventView.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class EventView: UIView {
	// haptic feedback and prints to console when button is pressed
	@objc func buttonPressed() -> Void {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.success)
		print("Explored")
	}

	// button for event
	lazy var addButton: UIButton = {
		let addButton = UIButton(type: .contactAdd)
		addButton.frame = CGRect(x: 265, y: 5, width: 30, height: 30)
		addButton.setTitle("Explore", for: .normal)
		addButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
		addButton.translatesAutoresizingMaskIntoConstraints = false
		return addButton
	}()

	// view for showing image of event
	lazy var eventView: UIImageView = {
		let image = UIImage(named: "alchemy_tour.jpg")
		let eventView = UIImageView(frame: CGRect(x: 0, y: 0, width: image!.size.width / 3.5, height: image!.size.height / 3.5))
		eventView.image = image
		eventView.translatesAutoresizingMaskIntoConstraints = false
		return eventView
	}()
	
	// label for event
	lazy var eventTitle: UILabel = {
		let eventTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
		eventTitle.font = UIFont.systemFont(ofSize: 18, weight: .medium)
		eventTitle.text = "The Alchemy Tour"
		eventTitle.textColor = UIColor(red: 255.0 / 255.0, green: 255.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
		eventTitle.textAlignment = .center
		eventTitle.translatesAutoresizingMaskIntoConstraints = false
		return eventTitle
	}()
	
	// view for event
	lazy var headerView: UIView = {
		let headerView = UIView(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
		
		// setting gradient background
		let topColor = UIColor(red: 31.0 / 255.0, green: 27.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0).cgColor
		let bottomColor = UIColor(red: 18.0 / 255.0, green: 18.0 / 255.0, blue: 18.0 / 255.0, alpha: 1.0).cgColor
		let gradient = CAGradientLayer()
		gradient.frame = headerView.bounds
		gradient.colors = [topColor, bottomColor]
		headerView.layer.insertSublayer(gradient, at: 0)
		
		headerView.addSubview(eventTitle)
		headerView.addSubview(addButton)
		
		headerView.translatesAutoresizingMaskIntoConstraints = false
		return headerView
	}()
	
	// gradient background view
	lazy var backgroundView: UIView = {
		let backgroundView = UIView(frame: CGRect(x: 0, y: 0, width: 667, height: 375))	// add auto-layout later
		return backgroundView
	}()
	
	// ----- end -----
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setCustomView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setCustomView()
	}
	
	// setting custom gradient background
	func setGradientBackground(_ topColor: CGColor, _ bottomColor: CGColor) -> Void {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame.size = self.backgroundView.frame.size
		gradientLayer.frame = backgroundView.bounds
		gradientLayer.colors = [topColor, bottomColor]
		gradientLayer.locations = [0.5, 1.0]
		gradientLayer.shouldRasterize = true
		backgroundView.layer.insertSublayer(gradientLayer, at: 0)
	}
	
	// adding views to subview
	func setCustomView() -> Void {
		addSubview(backgroundView)
		let topColor = UIColor(red: 18.0 / 255.0, green: 18.0 / 255.0, blue: 18.0 / 255.0, alpha: 1.0).cgColor
		let bottomColor = UIColor(red: 31.0 / 255.0, green: 27.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0).cgColor
		setGradientBackground(topColor, bottomColor)
		
		addSubview(eventView)
		addSubview(headerView)
		print("end of adding custom view")
	}
}
