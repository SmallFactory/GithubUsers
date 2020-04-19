//
//  FollowerListController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/15/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

protocol FollowerListControllerDelegate: class {
	func didRequestFollowers(for username: String)
}

class FollowerListController: UIViewController {
	
	enum Section {
		case main
	}

	var collectionView: UICollectionView!
	var dataSource: UICollectionViewDiffableDataSource<Section, Follower>!
	var filteredFollowers: [Follower] = []
	var followers: [Follower] = []
	var hasMoreFollowers = true
	var isSearching = false
	var page = 1
	var username: String!
	
	init(username: String) {
		super.init(nibName: nil, bundle: nil)
		self.username = username
		title = username
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()
		configureSearchController()
		configureViewController()
		configureCollectionView()
		getFollowers(username: username, page: page)
		configureDataSource()
	}
	
	private func configureViewController() {
		view.backgroundColor = .systemBackground
		navigationController?.navigationBar.prefersLargeTitles = true
		
		let addButton = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
		navigationItem.rightBarButtonItem = addButton
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		navigationController?.setNavigationBarHidden(false, animated: true)
	}
	
	private func configureCollectionView() {
		collectionView = UICollectionView(frame: view.bounds, collectionViewLayout: UIHelper.createThreeColumnFlowLayout(in: view))
		collectionView.backgroundColor = .systemBackground
		collectionView.delegate = self
		collectionView.register(FollowerCell.self, forCellWithReuseIdentifier: FollowerCell.resuseID)
		view.addSubview(collectionView)
	}
	
	private func configureSearchController() {
		let searchController = UISearchController()
		searchController.searchResultsUpdater = self
		searchController.searchBar.delegate = self
		searchController.searchBar.placeholder = "Search for a username"
		searchController.obscuresBackgroundDuringPresentation = false
		navigationItem.searchController = searchController
	}
	
	private func getFollowers(username: String, page: Int) {
		showLoadingView()
		NetworkManager.shared.getFollowers(for: username, page: page) { [weak self] result in
			guard let self = self else { return }
			self.dismissLoadingView()
			
			switch result {
			
			case .failure(let error):
				self.presentSFSAlertOnMainThread(title: "Bad Stuff Happened", message: error.rawValue, buttonTitle: "Ok")
			
			case .success(let followers):
				if followers.count < 100 { self.hasMoreFollowers = false }
				self.followers.append(contentsOf: followers)
				
				if self.followers.isEmpty {
					let message = "This user doesn't have any followers. Go follow them 😀."
					DispatchQueue.main.async {
						self.showEmptyStateView(with: message, in: self.view)
						return
					}
				}
				self.updateData(on: self.followers)
			}
		}
	}
	
	private func configureDataSource() {
		dataSource = UICollectionViewDiffableDataSource<Section, Follower>(collectionView: collectionView, cellProvider: { collectionView, indexPath, follower -> UICollectionViewCell? in
			let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FollowerCell.resuseID, for: indexPath) as! FollowerCell
			cell.set(follower: follower)
			return cell
		})
	}
	
	private func updateData(on followers: [Follower]) {
		var snapshot = NSDiffableDataSourceSnapshot<Section, Follower>()
		snapshot.appendSections([.main])
		snapshot.appendItems(followers)
		DispatchQueue.main.async {
			self.dataSource.apply(snapshot, animatingDifferences: true)
		}
	}
	
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		let activeArray = isSearching ? filteredFollowers : followers
		let follower = activeArray[indexPath.item]
		
		let userInfoVC = UserInfoController()
		userInfoVC.delegate = self
		userInfoVC.username = follower.login
		
		let navController = UINavigationController(rootViewController: userInfoVC)
		present(navController, animated: true)
	}
	
	@objc func addButtonTapped() {
		showLoadingView()
		
		NetworkManager.shared.getUserInfo(for: username) { [weak self] result in
			guard let self = self else { return }
			self.dismissLoadingView()
			
			switch result {
			case .success(let user):
				let favorite = Follower(login: user.login, avatarUrl: user.avatarUrl)
				PersistenceManager.updateWith(favorite: favorite, actionType: .add) { [weak self] error in
					guard let self = self else { return }
					
					guard let error = error else {
						self.presentSFSAlertOnMainThread(title: "Success!", message: "You have successfully favorited this user!", buttonTitle: "Hooray")
						return
					}
					
					self.presentSFSAlertOnMainThread(title: "Something went wrong!", message: error.rawValue, buttonTitle: "Ok")
				}
			case .failure(let error):
				self.presentSFSAlertOnMainThread(title: "Something went wrong", message: error.rawValue, buttonTitle: "Ok")
			}
		}
	}
}

extension FollowerListController: UICollectionViewDelegate {
	
	func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
		let offsetY = scrollView.contentOffset.y
		let contentHeight = scrollView.contentSize.height
		let height = scrollView.frame.size.height
		
		if offsetY > contentHeight - height {
			guard hasMoreFollowers else { return }
			page += 1
			getFollowers(username: username, page: page)
		}
	}
}

extension FollowerListController: UISearchResultsUpdating, UISearchBarDelegate {
	func updateSearchResults(for searchController: UISearchController) {
		guard let filter = searchController.searchBar.text, !filter.isEmpty else { return }
		isSearching = true
		filteredFollowers = followers.filter { $0.login.lowercased().contains(filter.lowercased()) }
		updateData(on: filteredFollowers)
	}
	
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		isSearching = false
		updateData(on: followers)
	}
}

extension FollowerListController: FollowerListControllerDelegate {
	func didRequestFollowers(for username: String) {
		self.username = username
		title = username
		page = 1
		followers.removeAll()
		filteredFollowers.removeAll()
		collectionView.setContentOffset(.zero, animated: true)
		getFollowers(username: username, page: page)
	}
}
