//
//  ViewController.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
	static var pageCount = 0

	// creates collection view
	fileprivate lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
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
	
	// name for event's location
	fileprivate lazy var eventLocationLabel: UILabel = {
		let eventLocationLabel = UILabel()
		eventLocationLabel.text = "Los Angeles, California"
		eventLocationLabel.textColor = UIColor(red: 150.0 / 255.0, green: 150.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
		eventLocationLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
		eventLocationLabel.sizeToFit()
		self.view.addSubview(eventLocationLabel)
		return eventLocationLabel
	}()
	
	// distance from event location and user
	fileprivate lazy var eventDistanceLabel: UILabel = {
		let eventDistanceLabel = UILabel()
		eventDistanceLabel.text = "-1 mi."
		eventDistanceLabel.textColor = UIColor(red: 150.0 / 255.0, green: 150.0 / 255.0, blue: 150.0 / 255.0, alpha: 1.0)
		eventDistanceLabel.font = UIFont.systemFont(ofSize: 16, weight: UIFont.Weight.light)
		eventDistanceLabel.sizeToFit()
		self.view.addSubview(eventDistanceLabel)
		return eventDistanceLabel
	}()
	
	// sets data for object
	fileprivate func setObject(object: String, str: String) {
		switch (object) {
			case "eventName":	// set event title
				eventNameLabel.text = str
				break;
			case "locationName":
				eventLocationLabel.text = str
				break
			case "eventDistance":
				eventDistanceLabel.text = str
				break
			default:	//do nothing
				print("Error: invalid object")
				break
		}
	}
	
	// dividing line between event data and carousel cells
	fileprivate lazy var horizontalLine: UIView = {
		let horizontalLine = UIView()
		horizontalLine.frame.size.height = 1.0
		horizontalLine.frame.size.width = self.view.bounds.width - 25
		horizontalLine.backgroundColor = UIColor(red: 130.0 / 255.0, green: 130.0 / 255.0, blue: 130.0 / 255.0, alpha: 1.0)
		self.view.addSubview(horizontalLine)
		return horizontalLine
	}()

	// centers collection view and adds color
	fileprivate func setUpCollectionView() {
		collectionView.delegate = self
		collectionView.dataSource = self
	
		collectionView.backgroundColor = UIColor(red: 239.0 / 255.0, green: 240.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 230).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.85).isActive = true
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.showsVerticalScrollIndicator = false
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 1.1).isActive = true
	}
	
	// sets constraints for event name, location, and distance
	fileprivate func setUpEventData() {
		eventNameLabel.translatesAutoresizingMaskIntoConstraints = false
		eventNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60).isActive = true
		eventNameLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true

		eventLocationLabel.translatesAutoresizingMaskIntoConstraints = false
		eventLocationLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 100).isActive = true
		eventLocationLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true

		eventDistanceLabel.translatesAutoresizingMaskIntoConstraints = false
		eventDistanceLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 125).isActive = true
		eventDistanceLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
	}
	
	// sets constraints for dividing horizontal line between event data and carousel
	fileprivate func setUpHorizontalLine() {
		horizontalLine.translatesAutoresizingMaskIntoConstraints = false
//		horizontalLine.topAnchor.constraint(equalTo: view.topAnchor, constant: 30).isActive = true
		horizontalLine.center = CGPoint(x: self.view.bounds.width / 2, y: 200)
//		horizontalLine.center = self.view.center
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		setUpEventData()
		setUpCollectionView()
		setUpHorizontalLine()
	}
}

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	// height of each event cell
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width * 0.85, height: collectionView.frame.height * 1.1)
	}
	
	// total number of event cells
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}
		
	// color of background of event cell
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCell
		return cell
	}
	
	// snapping cells after done scrolling (TO DO: FIX)
	func scrollViewWillEndDragging(_ scrollView: UIScrollView, withVelocity velocity: CGPoint, targetContentOffset: UnsafeMutablePointer<CGPoint>) {
		let layout = self.collectionView.collectionViewLayout as! UICollectionViewFlowLayout
		let cellWidthIncludingSpacing = layout.itemSize.width + layout.minimumLineSpacing
		
		var offset = targetContentOffset.pointee
		let index = (offset.x + scrollView.contentInset.left) / (cellWidthIncludingSpacing)
		let roundedIndex = round(index)
		
		offset = CGPoint(x: roundedIndex * cellWidthIncludingSpacing - scrollView.contentInset.left, y: scrollView.contentInset.top)
		targetContentOffset.pointee = offset
	}
	
	// if scrolling is done, haptic feedback
	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		if !(decelerate) {
			let generator = UIImpactFeedbackGenerator(style: .light)
			generator.impactOccurred()
		}
	}
}
