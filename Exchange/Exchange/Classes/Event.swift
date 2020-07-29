//
//  File.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/25/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class Event {
	// data members
	public var name: String
	public var venue: String
	public var eventDate: String
	public var city: String
	public var state: String
	public var distance: Float
	public var image: UIImage
	
	// constructor
	init(name: String = "N/A", venue: String = "N/A", eventDate: String = "01/01/2019", city: String = "N/A", state: String = "N/A", distance: Float = -1, image: UIImage) {
		self.name = name
		self.venue = venue
		self.eventDate = eventDate
		self.city = city
		self.state = state
		self.distance = distance / 1.0	// to cast to float
		self.image = image
	}
}
