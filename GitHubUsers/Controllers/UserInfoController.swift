//
//  UserInfoController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

protocol UserInfoControllerDelegate: class {
	func didRequestFollowers(for username: String)
}

class UserInfoController: UIViewController {

	private let contentView = UIView()
	private let scrollView = UIScrollView()
	
	private let dateLabel = SFSBodyLabel(textAlign: .center)
	private let headerView = UIView()
	private let itemViewOne = UIView()
	private let itemViewTwo = UIView()
	private var itemViews: [UIView] = []
	
	var username: String!
	weak var delegate: UserInfoControllerDelegate!
	
    override func viewDidLoad() {
        super.viewDidLoad()
		
		configureVC()
		layoutUI()
		getUserInfo()
	}
	
	private func configureVC() {
		view.backgroundColor = .systemBackground
		
		let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(dismissVC))
		navigationItem.rightBarButtonItem = doneButton
	}
	
	private func getUserInfo() {
		NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
			guard let self = self else { return }
			
			switch result {
			case .success(let user):
				DispatchQueue.main.async {
					self.configureUIElements(with: user)
				}
				
			case .failure(let error):
				self.presentSFSAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
				break
			}
		}
	}
	
	func configureUIElements(with user: User) {
		self.add(childVC: RepoItemController(user: user, delegate: self), to: self.itemViewOne)
		self.add(childVC: FollowerItemController(user: user, delegate: self), to: self.itemViewTwo)
		self.add(childVC: UserInfoHeaderController(user: user), to: self.headerView)

		self.dateLabel.text = "GitHub since \(user.createdAt.convertToMonthYearFormat())"
	}
	
	private func layoutUI() {
		let padding: CGFloat = 20
		let itemHeight: CGFloat = 140
		
		view.addSubviews(scrollView)
		scrollView.addSubview(contentView)
		
		scrollView.pinToEdges(of: view)
		contentView.pinToEdges(of: scrollView)
		
		
		itemViews = [headerView, itemViewOne, itemViewTwo, dateLabel]
		
		for itemView in itemViews {
			
			contentView.addSubview(itemView)
			itemView.translatesAutoresizingMaskIntoConstraints = false
			
			NSLayoutConstraint.activate([
				itemView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
				itemView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			])
		}
		
		NSLayoutConstraint.activate([
			contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
			contentView.heightAnchor.constraint(equalToConstant: 600),
			
			headerView.topAnchor.constraint(equalTo: contentView.topAnchor),
			headerView.heightAnchor.constraint(equalToConstant: 210),
			
			itemViewOne.topAnchor.constraint(equalTo: headerView.bottomAnchor, constant: padding),
			itemViewOne.heightAnchor.constraint(equalToConstant: itemHeight),
			
			itemViewTwo.topAnchor.constraint(equalTo: itemViewOne.bottomAnchor, constant: padding),
			itemViewTwo.heightAnchor.constraint(equalToConstant: itemHeight),
			
			dateLabel.topAnchor.constraint(equalTo: itemViewTwo.bottomAnchor, constant: 20),
			dateLabel.heightAnchor.constraint(equalToConstant: 50)
		])
	}
	
	private func add(childVC: UIViewController, to containerView: UIView) {
		addChild(childVC)
		containerView.addSubview(childVC.view)
		childVC.view.frame = containerView.bounds
		childVC.didMove(toParent: self)
	}
	
	@objc private func dismissVC() {
		dismiss(animated: true)
	}
}

extension UserInfoController: FollowerItemControllerDelegate {
	func didTapGetFollowers(for user: User) {
		guard user.followers != 0 else {
			presentSFSAlertOnMainThread(title: "No Followers", message: "This user has no followers", buttonTitle: "Ok")
			return
		}

		delegate.didRequestFollowers(for: user.login)
		dismissVC()
	}
}

extension UserInfoController: RepoItemControllerDelegate {
	func didTapGitHubProfile(for user: User) {
		guard let url = URL(string: user.htmlUrl) else {
			presentSFSAlertOnMainThread(title: "Invalid URL", message: "The url attached to this user is invalid", buttonTitle: "Ok")
			return
		}

		presentSafariVC(with: url)
	}
}
