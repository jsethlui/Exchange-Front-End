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
		let cell = UIImageView()
		cell.translatesAutoresizingMaskIntoConstraints = false
		if (cell.frame.width > cell.frame.height) { // if image view width is greater than image view height
			cell.contentMode = .scaleAspectFit	// stretch image but maintain original aspect ratio
		} else {	// if image view <= image view height
			cell.contentMode = .scaleAspectFill	// stretch image as large as can go + crop parts that don't fit
		}
		
		cell.clipsToBounds = true
		cell.backgroundColor = UIColor.green
		return cell
	}()
	
	// sets cell
	public func setCell(someNum: Int) {
		if (someNum == 1) {cell.backgroundColor = UIColor.red}
		if (someNum == 2) {cell.backgroundColor = UIColor.blue}
		else {cell.backgroundColor = UIColor.yellow}
	}
	
	// sets up cell
	private func setUpCell() -> Void {
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
