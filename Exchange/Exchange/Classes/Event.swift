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
	// note: public to avoid getters (maybe change?)
	public var name: String
	public var venue: String
	public var eventDate: String
	public var city: String
	public var state: String
	public var distance: Float
	public var headerImage: UIImage
	public var profileImage: UIImage
	
	// constructor
	init(_ name: String, venue: String, _ eventDate: String, _ city: String, _ state: String, distance: Float, headerImage: UIImage, profileImage: UIImage) {
		self.name = name
		self.venue = venue
		self.eventDate = eventDate
		self.city = city
		self.state = state
		self.distance = distance / 1.0	// to explicitly cast to float as backup measure
		self.headerImage = headerImage
		self.profileImage = profileImage
	}
	
	// returns event image
	public func getHeaderImage() -> String {
		return "illenium_header_image"
	}
}
