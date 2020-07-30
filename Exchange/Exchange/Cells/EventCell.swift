//
//  EventCell.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/21/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

extension UIImageView {
	func setCircularBorder() {
		self.layer.borderWidth = 2
		self.layer.masksToBounds = false
		self.layer.borderColor = UIColor.yellow.cgColor
		self.layer.cornerRadius = self.frame.height / 2
		self.clipsToBounds = true
	}
}

class EventCell: UICollectionViewCell {
	fileprivate let cell: UIImageView = {
//		let imageView = UIImageView()
//		imageView.translatesAutoresizingMaskIntoConstraints = false
//		imageView.contentMode = .scaleAspectFill
//		imageView.clipsToBounds = true
//		imageView.image = UIImage(named: "alchemy_tour")
//		imageView.layer.cornerRadius = 14
//		return imageView

		let event = Event("Illenium: Ascend Tour", venue: "Chase Center", "Saturday, December 14, 2019", "San Francisco", "CA", distance: -1, headerImage: UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)), mainImage: UIImageView(frame: CGRect(x: 0, y: 0, width: 100, height: 100)))
		event.headerImage.image = UIImage(named: "illenium_header_image")
		event.mainImage.image = UIImage(named: "illenium_main_image")

		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		if (imageView.frame.width > imageView.frame.height) { // if image view width is greater than image view height
			imageView.contentMode = .scaleAspectFit	// stretch image but maintain original aspect ratio
		} else {	// if image view <= image view height
			imageView.contentMode = .scaleAspectFill	// stretch image as large as can go + crop parts that don't fit
		}
		imageView.clipsToBounds = true
		imageView.image = event.headerImage.image
		
//		let profileImageView = UIImageView()
//		profileImageView.image = event.mainImage.image
//		profileImageView.setCircularBorder()
//		profileImageView.translatesAutoresizingMaskIntoConstraints = false
	
		return imageView
	}()
	
	func setUpCell() -> Void {
		cell.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		cell.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
		cell.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
		cell.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
	}
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		
		contentView.addSubview(cell)
		setUpCell()
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
