//
//  FollowerItemController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import Foundation

protocol FollowerItemControllerDelegate: class {
	func didTapGetFollowers(for user: User)
}

class FollowerItemController: ItemInfoController {
	
	weak var delegate: FollowerItemControllerDelegate!
	
	init(user: User, delegate: FollowerItemControllerDelegate) {
		super.init(user: user)
		self.delegate = delegate
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureItems()
	}
	
	private func configureItems() {
		itemInfoViewOne.set(itemInfoType: .followers, with: user.followers)
		itemInfoViewTwo.set(itemInfoType: .following, with: user.following)
		
		actionButton.set(backgroundColor: .systemGreen, title: "Get Followers")
	}
	
	override func actionButtonTapped() {
		delegate.didTapGetFollowers(for: user)
	}
}
