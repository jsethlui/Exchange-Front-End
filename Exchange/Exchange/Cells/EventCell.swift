//
//  EventCell.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/21/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {

	var data: Event? {
		didSet {
			guard let data = data else {return}
			eventHeaderImageView.image = data.headerImage
			artistProfileButton.setImage(data.profileImage, for: .normal)
		}
	}

	lazy var imageView: UIImageView = {
		let imageView = UIImageView()
		if (imageView.frame.width > imageView.frame.height) { // if image view width is greater than image view height
			imageView.contentMode = .scaleAspectFit	// stretch image but maintain original aspect ratio
		} else {	// if image view <= image view height
			imageView.contentMode = .scaleAspectFill	// stretch image as large as can go + crop parts that don't fit
		}
		
		imageView.clipsToBounds = true
		imageView.backgroundColor = mainViewBackgroundColor
		imageView.backgroundColor = UIColor(red: 255.0 / 255.0, green: 254.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
		return imageView
	}()
	
	lazy var artistProfileButton: UIButton = {
		let artistProfileButton = UIButton()
		//let profileImage = UIImage(named: profileImageName)
		let profileImage = UIImage(named: "illenium_profile_image")
		artistProfileButton.frame = CGRect(x: 0, y: 0, width: profileImage!.size.width, height: profileImage!.size.height)
		
		// setting border to be circular
		artistProfileButton.layer.cornerRadius = artistProfileButton.bounds.size.width / 2.0
		artistProfileButton.clipsToBounds = true
		artistProfileButton.setImage(profileImage, for: .normal)
		artistProfileButton.layer.borderWidth = 4
		artistProfileButton.layer.borderColor = mainViewBackgroundColor.cgColor
		
		return artistProfileButton
	}()
	
	lazy var eventHeaderImageView: UIImageView = {
		let eventHeaderImageView = UIImageView()
		//let eventHeaderImage = UIImage(named: headerImageName)!
		let eventHeaderImage = UIImage(named: "illenium_header_image")!
		eventHeaderImageView.backgroundColor = UIColor.red
		eventHeaderImageView.setScaling(image: eventHeaderImage)
		let screenSize = UIScreen.main.bounds
		eventHeaderImageView.frame = CGRect(x: 132.5, y: 45, width: screenSize.width / 3.35, height: screenSize.height / 3.35)
		return eventHeaderImageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		self.contentView.backgroundColor = mainViewBackgroundColor
		setupCell()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

extension EventCell {
	fileprivate func setupCell() {
		// image view
		self.addSubview(imageView)
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		imageView.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
		imageView.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
		imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
		
		// event header image
		self.addSubview(eventHeaderImageView)
//		eventHeaderImageView.translatesAutoresizingMaskIntoConstraints = false
//		eventHeaderImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 30).isActive = true
//		eventHeaderImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
		
		// artist profile button
		self.addSubview(artistProfileButton)
		artistProfileButton.translatesAutoresizingMaskIntoConstraints = false
		artistProfileButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 190).isActive = true
		artistProfileButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 105).isActive = true
		artistProfileButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -105).isActive = true
	}
}

extension UIImageView {
	fileprivate func setScaling(image: UIImage) {
		if (self.frame.width > self.frame.height) { // if image view width is greater than image view height
			self.contentMode = .scaleAspectFit	// stretch image but maintain original aspect ratio
		} else {	// if image view <= image view height
			self.contentMode = .scaleAspectFill	// stretch image as large as can go + crop parts that don't fit
		}
		self.image = image
	}
}
