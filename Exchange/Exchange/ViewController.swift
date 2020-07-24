//
//  ViewController.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	// height of each event cell
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width * 0.85, height: collectionView.frame.width)
	}
	
	// total number of event cells
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}
		
	// color of background of event cell
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCell
		cell.backgroundColor = UIColor(red: 238.0 / 255.0, green: 120.0 / 255.0, blue: 47.0 / 255.0, alpha: 1.0)
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
		let generator = UIImpactFeedbackGenerator(style: .light)
		generator.impactOccurred()
	}
}

class ViewController: UIViewController {

	// creates collection view
	fileprivate lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(EventCell.self, forCellWithReuseIdentifier: "cell")
		return collectionView
	}()
	
	// name for event
	fileprivate lazy var eventNameLabel: UILabel = {
		let eventNameLabel = UILabel()
		eventNameLabel.text = "Illenium: Ascend Tour"
		eventNameLabel.font = UIFont(name: "SF Pro Text", size: 44.0)
		eventNameLabel.sizeToFit()
		return eventNameLabel
	}()
	
	// name for event's location
	fileprivate lazy var locationNameLabel: UILabel = {
		let locationNameLabel = UILabel()
		locationNameLabel.text = "Los Angeles, California"
		eventNameLabel.sizeToFit()
		return locationNameLabel
	}()
	
	// distance from event location and user
	fileprivate lazy var eventDistanceLabel: UILabel = {
		let eventDistanceLabel = UILabel()
		eventDistanceLabel.text = "-1"
		eventNameLabel.sizeToFit()
		return eventDistanceLabel
	}()
	
	// sets data for object
	fileprivate func setObject(object: String, str: String) {
		switch (object) {
			case "eventName":	// set event title
				eventNameLabel.text = str
				break;
			case "locationName":
				locationNameLabel.text = str
				break
			case "eventDistance":
				eventDistanceLabel.text = str
				break
			default:	//do nothing
				print("Error: invalid object")
				break
		}
	}

	// centers collection view and adds color
	fileprivate func setUpCollectionView() {
		collectionView.backgroundColor = UIColor(red: 239.0 / 255.0, green: 240.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.85).isActive = true
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.showsVerticalScrollIndicator = false
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.85).isActive = true
	}
	
	fileprivate func setUpEventData() {
//		eventNameLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 200).isActive = true
//		eventNameLabel.center = view.center
		eventNameLabel.frame.origin = CGPoint(x : 30, y: 40)
	}

	override func viewDidLoad() {
		super.viewDidLoad()

		self.view.addSubview(eventNameLabel)
		setUpEventData()

		self.view.addSubview(collectionView)
		setUpCollectionView()
	}
}

// To Do:
// add city and state as separate data
// add constraints to labels
