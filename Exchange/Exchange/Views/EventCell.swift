//
//  EventCell.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/21/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
	fileprivate let bg: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.image = UIImage(named: "alchemy_tour")
		imageView.layer.cornerRadius = 12
		return imageView
	}()
	
	override init(frame: CGRect) {
		super.init(frame: .zero)
		contentView.addSubview(bg)
		
		bg.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
		bg.leftAnchor.constraint(equalTo: contentView.leftAnchor).isActive = true
		bg.rightAnchor.constraint(equalTo: contentView.rightAnchor).isActive = true
		bg.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
