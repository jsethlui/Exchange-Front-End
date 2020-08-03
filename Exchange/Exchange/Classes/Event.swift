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
	
	// array of all events
	static func getInterests() -> [Event] {
		return [
			Event("Illenium: Ascend Tour", venue: "Chase Center", "Sat. Dec 14", "San Francisco", "CA", distance: -1, headerImage: UIImage(named: "illenium_header_image")!, profileImage: UIImage(named: "illenium_profile_image")!),
			Event("Dabin: Into The Wild", venue: "The Regency Ballroom", "Mon. March 30", "San Francicso", "CA", distance: -1, headerImage: UIImage(named: "dabin_header_image")!, profileImage: UIImage(named: "dabin_profile_image")!),
			Event("Slander: The Eye Tour", venue: "Bill Graham Civic Auditorium", "Fri. April 3", "San Francisco", "CA", distance: -1, headerImage: UIImage(named: "slander_header_image")!, profileImage: UIImage(named: "slander_profile_image")!),
		]
	}
	
	// gets total number of interestss
	func getNumInterests() -> Int {
		return Event.getInterests().count
	}
}
