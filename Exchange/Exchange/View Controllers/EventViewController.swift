//
//  EventViewController.swift
//  Exchange
//
//  Created by Jeremy Louie on 8/4/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class EventViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	let eventCellID = "eventCellID"
	
	fileprivate lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .vertical
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		return collectionView
	}()
	
	let events: [Event] = [
		Event("Illenium: Ascend Tour", venue: "Chase Center", "Sat. Dec 14", "San Francisco", "CA", distance: -1, headerImage: UIImage(named: "illenium_header_image")!, profileImage: UIImage(named: "illenium_profile_image")!),
		Event("Dabin: Into The Wild", venue: "The Regency Ballroom", "Mon. March 30", "San Francicso", "CA", distance: -1, headerImage: UIImage(named: "dabin_header_image")!, profileImage: UIImage(named: "dabin_profile_image")!),
		Event("Slander: The Eye Tour", venue: "Bill Graham Civic Auditorium", "Fri. April 3", "San Francisco", "CA", distance: -1, headerImage: UIImage(named: "slander_header_image")!, profileImage: UIImage(named: "slander_profile_image")!),
	]
}

//extension EventViewController {
//	override func viewDidLoad() {
//		super.viewDidLoad()
//		setupSubViews()
//		print("another test")
//	}
//}

extension EventViewController {
	fileprivate func setupSubViews() {
		view.backgroundColor = UIColor.blue
		view.addSubview(collectionView)
		
		collectionView.register(EventCell.self, forCellWithReuseIdentifier: eventCellID)
		collectionView.dataSource = self
		collectionView.delegate = self
	}
}

extension EventViewController {
	func collectionView(_ eventView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return events.count
	}
	
	func collectionView(_ eventView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: eventCellID, for: indexPath) as! EventCell
		let event = events[indexPath.row]
//		cell.imageView.image = UIImage.init(named: event.getHeaderImage())
		return cell
	}
}
