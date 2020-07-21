//
//  SelectEventView.swift
//  Exchange
//
//  Created by Jeremy Louie on 7/21/20.
//  Copyright © 2020 Jeremy Louie. All rights reserved.
//

import UIKit

class SelectEventView: UIViewController {
	fileprivate lazy var collectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		layout.scrollDirection = .horizontal
		
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		collectionView.translatesAutoresizingMaskIntoConstraints = false
		collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
		print("ran")
		return collectionView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		view.addSubview(collectionView)
	}
}
