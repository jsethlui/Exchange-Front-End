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

	// returns total number of events, is also total number of cells
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return data.count
	}

	private func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: NSIndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath as IndexPath) as! EventCell
		return cell
	}

	// color of background of event collection view
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCell
		cell.data = self.data[indexPath.item]
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
		//collectionView.decelerationRate = UIScrollView.DecelerationRate.fast
		let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		let bounds = scrollView.bounds
		let yTarget = targetContentOffset.pointee.y

		// This is the max contentOffset.x to allow. With this as contentOffset.x, the right edge of the last column of cells is at the right edge of the collection view's frame.
		let yMax = scrollView.contentSize.height - scrollView.bounds.height
		print("yMax: \(yMax)")

		var snapToMostVisibleColumnVelocityThreshold: CGFloat {
			return 0.3
		}
		if abs(velocity.y) <= snapToMostVisibleColumnVelocityThreshold {
			let yCenter = scrollView.bounds.midY
			let poses = layout.layoutAttributesForElements(in: bounds) ?? []
			// Find the column whose center is closest to the collection view's visible rect's center.
			let y = poses.min(by: { abs($0.center.y - yCenter) < abs($1.center.y - yCenter) })?.frame.origin.y ?? 0
			targetContentOffset.pointee.y = y
		} else if velocity.y > 0 {
			let poses = layout.layoutAttributesForElements(in: CGRect(x: yTarget, y: 0, width: bounds.size.width, height: bounds.size.height)) ?? []
			// Find the leftmost column beyond the current position.
			let yCurrent = scrollView.contentOffset.y
			let y = poses.filter({ $0.frame.origin.y > yCurrent}).min(by: { $0.center.y < $1.center.y })?.frame.origin.y ?? yMax
			targetContentOffset.pointee.y = min(y, yMax)
		} else {
			let poses = layout.layoutAttributesForElements(in: CGRect(x: yTarget - bounds.size.height, y: 0, width: bounds.size.width, height: bounds.size.height)) ?? []
			// Find the rightmost column.
			let y = poses.max(by: { $0.center.y < $1.center.y })?.frame.origin.y ?? 0
			targetContentOffset.pointee.y = max(y, 0)
		}
	}
}

// returns primary background color as static
public var mainViewBackgroundColor: UIColor {
	get {
		return UIColor(red: 255.0 / 255.0, green: 254.0 / 255.0, blue: 255.0 / 255.0, alpha: 1.0)
	}
}

class ViewController: UIViewController {
	
	let data = [
		Event("Illenium: Ascend Tour", venue: "Bill Graham Civic Auditorium", "01/01/20", "San Francisco", "CA", distance: -1, headerImage: UIImage(named: "illenium_header_image")!, profileImage: UIImage(named: "illenium_profile_image")!),
		Event("Dabin: Into The Wild", venue: "The Regency Ballroom", "02/02/20", "San Francisco", "CA", distance: -1, headerImage: UIImage(named: "dabin_header_image")!, profileImage: UIImage(named: "dabin_profile_image")!),
	]
	
	// creates collection view
	fileprivate lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical

		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		//collectionView.backgroundColor = mainViewBackgroundColor
		collectionView.register(EventCell.self, forCellWithReuseIdentifier: "cell")
		self.view.addSubview(collectionView)
		return collectionView
	}()

	@objc func eventButtonPressed(sender: UIButton!) {
		print("event pressed")
	}

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
	
	/* -----end of functions that establish constraints----- */
	
	override func viewDidLoad() {
		super.viewDidLoad()

		self.collectionView.register(EventCell.self, forCellWithReuseIdentifier: "illeniumCell")
		self.collectionView.register(EventCell.self, forCellWithReuseIdentifier: "dabinCell")
		self.collectionView.register(EventCell.self, forCellWithReuseIdentifier: "slanderCell")
		
		setUpCollectionView()
	}
}
