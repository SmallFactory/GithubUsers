//
//  RepoItemController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import Foundation

class RepoItemController: ItemInfoController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		configureItems()
	}
	
	private func configureItems() {
		itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
		itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
		
		actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
	}
	
	override func actionButtonTapped() {
		delegate.didTapGitHubProfile(for: user)
	}
}
