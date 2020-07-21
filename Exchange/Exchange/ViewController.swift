//
//  ViewController.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/19/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

extension ViewController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / 2.5, height: collectionView.frame.width / 2)
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 6
	}
	
	func collectionView(_ collectioNView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! EventCell
		cell.backgroundColor = UIColor(red: 238.0 / 255.0, green: 120.0 / 255.0, blue: 47.0 / 255.0, alpha: 1.0)
		return cell
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
		print("ran")
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
	}

	override func viewDidLoad() {
		// Do any additional setup after loading the view.
		super.viewDidLoad()
		
//		let view = EventView()
//		self.view.addSubview(view)

		self.view.addSubview(collectionView)
		setUpCollectionView()
		collectionView.heightAnchor.constraint(equalToConstant: view.frame.width / 2).isActive = true
	}
}

