//
//  EventView.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class EventView: UIView {
	// button for event
	let image = UIImage(named: "alchemy_tour.jpg")
	
	// profile button to edit user profile
	lazy var profileButton: UIButton = {
		let profileButtonImage = UIImage(named: "profile")
		let profileButton = UIButton(type: .contactAdd)
		profileButton.setImage(profileButtonImage!, for: .normal)	// change to not using force wrapping
		profileButton.frame = CGRect(x: 5, y: 20, width: 60, height: 60)
		return profileButton
	}()
	
	// message center button to message other users
	lazy var messageCenterButton: UIButton = {
		let messageCenterButtonImage = UIImage(named: "messageCenter")
		let messageCenterButton = UIButton(frame: CGRect(x: 100, y: 100, width: 60, height: 60))
		messageCenterButton.setImage(messageCenterButtonImage!, for: .normal)	// change to not using force wrapping
		messageCenterButton.frame = CGRect(x: 200, y: 20, width: 50, height: 50)
		return messageCenterButton
	}()
	
	lazy var openButton: UIButton = {
		let openButton = UIButton(type: .contactAdd)
		openButton.frame = CGRect(x: 0, y: 9, width: image!.size.width / 3.5, height: image!.size.height / 3.5)
		openButton.setTitle("Explore", for: .normal)
		openButton.setTitleColor(UIColor.white, for: .normal)
		openButton.translatesAutoresizingMaskIntoConstraints = false
		
		openButton.isEnabled = true
		openButton.isUserInteractionEnabled = true
		openButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
		return openButton
	}()
	
	// haptic feedback and prints to console when button is pressed
	@objc func buttonPressed(sender: UIButton!) -> Void {
		let generator = UINotificationFeedbackGenerator()
		generator.notificationOccurred(.success)
		print("Explored")
	}

	// view for showing image of event
	lazy var eventView: UIImageView = {
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
		headerView.translatesAutoresizingMaskIntoConstraints = false
		return headerView
	}()
	
	// gradient background view
	lazy var backgroundView: UIView = {
		let backgroundView = UIView(frame: UIScreen.main.bounds)
		backgroundView.backgroundColor = UIColor(red: 31.0 / 255.0, green: 27.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0)	// to fill in screen's edges
		return backgroundView
	}()
	
	// setting custom gradient background
	func setGradientBackground(_ topColor: CGColor, _ bottomColor: CGColor) -> Void {
		let gradientLayer = CAGradientLayer()
		gradientLayer.frame.size = self.backgroundView.frame.size
		gradientLayer.frame = backgroundView.bounds
		gradientLayer.colors = [topColor, bottomColor]
		gradientLayer.locations = [0.5, 1.0]
		gradientLayer.shouldRasterize = true
		backgroundView.layer.addSublayer(gradientLayer)
	}
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setCustomView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setCustomView()
	}
	
	// setting custom view
	private func setCustomView() -> Void {
		addSubview(backgroundView)
		let topColor = UIColor(red: 40.0 / 255.0, green: 30.0 / 255.0, blue: 40.0 / 255.0, alpha: 1.0).cgColor
		let bottomColor = UIColor(red: 31.0 / 255.0, green: 27.0 / 255.0, blue: 36.0 / 255.0, alpha: 1.0).cgColor
		setGradientBackground(topColor, bottomColor)
		
		addSubview(profileButton)
		addSubview(messageCenterButton)
		
		addSubview(eventView)
		//addSubview(headerView)
		addSubview(openButton)
		setLayout()
	}
	
	private func setLayout() -> Void {
		eventView.center = backgroundView.center

	}
}
