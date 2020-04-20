//
//  RepoItemController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import Foundation

protocol RepoItemControllerDelegate: class {
	func didTapGitHubProfile(for user: User)
}

class RepoItemController: ItemInfoController {
	
	weak var delegate: RepoItemControllerDelegate!
	
	init(user: User, delegate: RepoItemControllerDelegate) {
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
		itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
		itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
		
		actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
	}
	
	override func actionButtonTapped() {
		delegate.didTapGitHubProfile(for: user)
	}
}
