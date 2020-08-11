//
//  User.swift
//  Exchange
//
//  Created by Jeremy Louie on 8/7/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class User {
	public var firstName: String
	public var lastName: String
	public var age: Int
	public var city: String
	public var state: String
	public var profileImage: UIImage
	public var headerImage: UIImage
	
	init(firstName: String, lastName: String, age: Int, city: String, state: String, profileImage: UIImage, headerImage: UIImage) {
		self.firstName = firstName
		self.lastName = lastName
		self.age = age
		self.city = city
		self.state = state
		self.profileImage = profileImage
		self.headerImage = headerImage
	}
}
