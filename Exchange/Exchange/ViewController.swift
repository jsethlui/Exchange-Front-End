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
	func collectionView(_ collectioNView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
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

	// centers collection view and adds color
	func setUpCollectionView() -> Void {
		collectionView.backgroundColor = UIColor(red: 239.0 / 255.0, green: 240.0 / 255.0, blue: 241.0 / 255.0, alpha: 1.0)
		collectionView.delegate = self
		collectionView.dataSource = self
		collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 55).isActive = true
		collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
		collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.height * 0.85).isActive = true
		collectionView.showsHorizontalScrollIndicator = false
		collectionView.showsVerticalScrollIndicator = false
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		
//		let view = EventView()
//		self.view.addSubview(view)

		self.view.addSubview(collectionView)
		setUpCollectionView()
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.width * 0.85).isActive = true
	}
}

