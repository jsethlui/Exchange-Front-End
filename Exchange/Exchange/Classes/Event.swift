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
	// note: public to avoid getters
	public var name: String
	public var venue: String
	public var eventDate: String
	public var city: String
	public var state: String
	public var distance: Float
	public var headerImage: UIImageView
	public var mainImage: UIImageView
	
	// constructor
	init(_ name: String, venue: String, _ eventDate: String, _ city: String, _ state: String, distance: Float, headerImage: UIImageView, mainImage: UIImageView) {
		self.name = name
		self.venue = venue
		self.eventDate = eventDate
		self.city = city
		self.state = state
		self.distance = distance
		self.headerImage = headerImage
		self.mainImage = mainImage
	}
}
