//
//  ViewController.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
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

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	// width and height of each event cell
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 2)
	}
	
	// total number of event cells
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	// color of background of event cell
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCell
		let eventButton = UIButton()
		eventButton.frame.size = CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
		eventButton.addTarget(self, action: #selector(eventButtonPressed), for: .touchUpInside)
		cell.addSubview(eventButton)
		return cell
	}
	
	// sets distance between cells
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 50
	}
	
	// sets distance between cells
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 50
	}
	
	 //snapping cells after done scrolling (TO DO: FIX)
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		let bounds = scrollView.bounds
		let xTarget = targetContentOffset.pointee.x

		// This is the max contentOffset.x to allow. With this as contentOffset.x, the right edge of the last column of cells is at the right edge of the collection view's frame.
		let xMax = scrollView.contentSize.width - scrollView.bounds.width

		var snapToMostVisibleColumnVelocityThreshold: CGFloat { return 0.3 }
		if abs(velocity.x) <= snapToMostVisibleColumnVelocityThreshold {
			let xCenter = scrollView.bounds.midX
			let poses = layout.layoutAttributesForElements(in: bounds) ?? []
			// Find the column whose center is closest to the collection view's visible rect's center.
			let x = poses.min(by: { abs($0.center.x - xCenter) < abs($1.center.x - xCenter) })?.frame.origin.x ?? 0
			targetContentOffset.pointee.x = x
		} else if velocity.x > 0 {
			let poses = layout.layoutAttributesForElements(in: CGRect(x: xTarget, y: 0, width: bounds.size.width, height: bounds.size.height)) ?? []
			// Find the leftmost column beyond the current position.
			let xCurrent = scrollView.contentOffset.x
			let x = poses.filter({ $0.frame.origin.x > xCurrent}).min(by: { $0.center.x < $1.center.x })?.frame.origin.x ?? xMax
			targetContentOffset.pointee.x = min(x, xMax)
		} else {
			let poses = layout.layoutAttributesForElements(in: CGRect(x: xTarget - bounds.size.width, y: 0, width: bounds.size.width, height: bounds.size.height)) ?? []
			// Find the rightmost column.
			let x = poses.max(by: { $0.center.x < $1.center.x })?.frame.origin.x ?? 0
			targetContentOffset.pointee.x = max(x, 0)
		}
	}
}

class ViewController: UIViewController {
	static var pageCount = 0
	let mainViewBackgroundColor = UIColor(red: 255.0 / 255.0, green: 254.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
	
	/* -----start of buttons, collection views, etc----- */
	
	// creates collection view
	fileprivate lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.backgroundColor = mainViewBackgroundColor
		collectionView.register(EventCell.self, forCellWithReuseIdentifier: "cell")
		self.view.addSubview(collectionView)
		return collectionView
	}()
	
	// name for event
	fileprivate lazy var eventNameLabel: UILabel = {
		let eventNameLabel = UILabel()
		eventNameLabel.text = "Illenium: Ascend Tour"
		eventNameLabel.font = UIFont.systemFont(ofSize: 28, weight: UIFont.Weight.regular)	// setting font to SF typeface
		eventNameLabel.sizeToFit()
		self.view.addSubview(eventNameLabel)
		return eventNameLabel
	}()
//
//	// name for event's location
//	fileprivate lazy var eventLocationLabel: UILabel = {
//		let eventLocationLabel = UILabel()
//		eventLocationLabel.text = "Los Angeles, California"
//		eventLocationLabel.textColor = UIColor(red: 150.0 / 255.0, green: 150.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
//		eventLocationLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
//		eventLocationLabel.sizeToFit()
//		self.view.addSubview(eventLocationLabel)
//		return eventLocationLabel
//	}()
//
//	// distance from event location and user
//	fileprivate lazy var eventDistanceLabel: UILabel = {
//		let eventDistanceLabel = UILabel()
//		eventDistanceLabel.text = "-1 mi."
//		eventDistanceLabel.textColor = UIColor(red: 150.0 / 255.0, green: 150.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
//		eventDistanceLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
//		eventDistanceLabel.sizeToFit()
//		self.view.addSubview(eventDistanceLabel)
//		return eventDistanceLabel
//	}()
	
	// dividing line between event data and carousel cells
//	fileprivate lazy var horizontalLine: UIView = {
//		let horizontalLine = UIView()
//		horizontalLine.frame.size.height = 1.3
//		horizontalLine.frame.size.width = self.view.bounds.width - 30
//		horizontalLine.backgroundColor = UIColor(red: 130.0 / 255.0, green: 130.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
//		horizontalLine.sizeToFit()
//		self.view.addSubview(horizontalLine)
//		return horizontalLine
//	}()
	
	// profile button
	fileprivate lazy var profileButton: UIButton = {
		let profileButton = UIButton()
		profileButton.setImage(UIImage(named: "resized_profile"), for: .normal)
		profileButton.addTarget(self, action: #selector(profileButtonPressed), for: .touchUpInside)
		self.view.addSubview(profileButton)
		return profileButton
	}()
	
	// action for when profile button is pressed
	@objc func profileButtonPressed(sender: UIButton!) {
		print("profile button pressed")
	}
	
	// message center button
	fileprivate lazy var messageCenterButton: UIButton = {
		let messageCenterButton = UIButton()
		messageCenterButton.setImage(UIImage(named: "resized_message_center"), for: .normal)
		messageCenterButton.addTarget(self, action: #selector(messageCenterButtonPressed), for: .touchUpInside)
		self.view.addSubview(messageCenterButton)
		return messageCenterButton
	}()
	
	// action for when message center button is pressed
	@objc func messageCenterButtonPressed(sender: UIButton!) {
		print("message center button pressed")
	}
	
	@objc func eventButtonPressed(sender: UIButton!) {
		print("event pressed")
	}
	
	// avatar profile button
	fileprivate lazy var artistProfileButton: UIButton = {
		let artistProfileButton = UIButton()
		let profileImage = UIImage(named: "illenium_main_image")
		artistProfileButton.frame = CGRect(x: 0, y: 0, width: profileImage!.size.width, height: profileImage!.size.height)
		artistProfileButton.layer.cornerRadius = artistProfileButton.bounds.size.width / 2.0
		artistProfileButton.clipsToBounds = true
		artistProfileButton.setImage(profileImage, for: .normal)
		artistProfileButton.layer.borderWidth = 4
		artistProfileButton.layer.borderColor = mainViewBackgroundColor.cgColor
		self.view.addSubview(artistProfileButton)
		return artistProfileButton
	}()
	
	/* -----end of buttons, collection views, etc----- */
	/* -----start of functions that establish constraints----- */
	
	// centers collection view and adds color
	fileprivate func setUpCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 5).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.85).isActive = true
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.showsVerticalScrollIndicator = false
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.width).isActive = true
	}
	
	// sets constraints for event name, location, and distance
	fileprivate func setUpEventData() {
		let factor = 35
		
		eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
		eventNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(300)).isActive = true
		eventNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
		eventNameLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true

//		eventLocationLabel.translatesAutoresizingMaskIntoConstraints = false
//		eventLocationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(90 + factor)).isActive = true
//		eventLocationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
//
//		eventDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
//		eventDistanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: CGFloat(115 + factor)).isActive = true
//		eventDistanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
	}
	
	// sets constraints for dividing horizontal line between event data and carousel
	fileprivate func setUpHorizontalLine() {
//		horizontalLine.translatesAutoresizingMaskIntoConstraints = false
//		horizontalLine.center = CGPoint(x: self.view.bounds.width / 2, y: 200)
	}
	
	// sets constraints for profile button
	fileprivate func setUpProfileButton() {
		profileButton.translatesAutoresizingMaskIntoConstraints = false
		profileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
		profileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
	}
	
	// sets constraints for message center button
	fileprivate func setUpMessageCenterButton() {
		messageCenterButton.translatesAutoresizingMaskIntoConstraints = false
		messageCenterButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
		messageCenterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
	}
	
	fileprivate func setUpArtistProfileButton() {
		artistProfileButton.translatesAutoresizingMaskIntoConstraints = false
		artistProfileButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 225).isActive = true
		artistProfileButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 105).isActive = true
		artistProfileButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -105).isActive = true
	}
	
	/* -----end of functions that establish constraints----- */
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		self.view.backgroundColor = mainViewBackgroundColor
		
		setUpEventData()
		setUpCollectionView()
		setUpHorizontalLine()
		setUpProfileButton()
		setUpMessageCenterButton()
		setUpArtistProfileButton()
	}
}
