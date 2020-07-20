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
	lazy var addButton: UIButton = {
		let addButton = UIButton(type: .contactAdd)
		addButton.frame = CGRect(x: 265, y: 5, width: 30, height: 30)
		addButton.setTitle("Explore", for: .normal)
		return addButton
	}()

	// view for showing image of event
	lazy var eventView: UIImageView = {
		let eventView = UIImageView(frame: CGRect(x: 0, y: 0, width: 300, height: 260))
		eventView.image = UIImage(named: "alchemy_tour")
		return eventView
	}()
	
	// label for event
	lazy var eventTitle: UILabel = {
		let eventTitle = UILabel(frame: CGRect(x: 0, y: 0, width: 300, height: 40))
		eventTitle.font = UIFont.systemFont(ofSize: 22, weight: .medium)
		eventTitle.text = "Alchemy Tour"
		eventTitle.textAlignment = .center
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
		return headerView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		setCustomView()
	}
	
	required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		setCustomView()
	}
	
	// adding views to subview
	func setCustomView() -> Void {
		addSubview(eventView)
		addSubview(headerView)
		print("end of adding custom view")
	}
}
