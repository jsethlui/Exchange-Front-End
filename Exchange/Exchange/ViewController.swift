//
//  ViewController.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	// width and height of each event cell
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: view.frame.width, height: view.frame.height)
	}
	
	// total number of event cells
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 5
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
		if (indexPath.item == 1) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "illeniumCell", for: indexPath as IndexPath) as! EventCell
			cell.setCell(someNum: 1)
			return cell
		} else if (indexPath.item == 2) {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "dabinCell", for: indexPath as IndexPath) as! EventCell
			cell.setCell(someNum: 2)
			return cell
		} else {
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "slanderCell", for: indexPath as IndexPath) as! EventCell
			cell.setCell(someNum: 3)
			return cell
		}
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
		return 5
	}
	
	// sets distance between cells
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 5
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
		layout.scrollDirection = .vertical
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.backgroundColor = mainViewBackgroundColor
		collectionView.register(EventCell.self, forCellWithReuseIdentifier: "cell")
		self.view.addSubview(collectionView)
		return collectionView
	}()
	
	@objc func eventButtonPressed(sender: UIButton!) {
		print("event pressed")
	}
	
	// avatar profile button
	fileprivate lazy var artistProfileButton: UIButton = {
		let artistProfileButton = UIButton()
		let profileImage = UIImage(named: "illenium_profile_image")
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
		
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.showsVerticalScrollIndicator = false
		
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: -20).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
		collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 20).isActive = true
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
		
		setUpCollectionView()
		setUpArtistProfileButton()
	}
}
