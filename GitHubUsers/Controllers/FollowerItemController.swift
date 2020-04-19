//
//  FollowerItemController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import Foundation

class FollowerItemController: ItemInfoController {
	
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
