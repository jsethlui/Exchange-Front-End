//
//  EventCell.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/21/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class EventCell: UICollectionViewCell {
	fileprivate let cell: UIImageView = {
		let imageView = UIImageView()
		imageView.translatesAutoresizingMaskIntoConstraints = false
		imageView.contentMode = .scaleAspectFill
		imageView.clipsToBounds = true
		imageView.image = UIImage(named: "alchemy_tour")
		imageView.layer.cornerRadius = 12
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
