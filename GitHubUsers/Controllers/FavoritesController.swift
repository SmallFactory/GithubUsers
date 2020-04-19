//
//  FavoritesController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/14/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class FavoritesController: UIViewController {
	
	let tableView = UITableView()
	var favorites: [Follower] = []

	override func viewDidLoad() {
		super.viewDidLoad()
		
		compose()
		constrain()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		getFavorites()
	}
	
	private func compose() {
		view.backgroundColor = .systemBackground
		title = "Favorites"
		
		navigationController?.navigationBar.prefersLargeTitles = true
		
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(FavoriteCell.self, forCellReuseIdentifier: FavoriteCell.resuseID)
		view.addSubview(tableView)
	}
	
	private func constrain() {
		tableView.frame = view.bounds
		tableView.rowHeight = 80
	}
	
	func getFavorites() {
		PersistenceManager.retrieveFavorites { [weak self] result in
			guard let self = self else { return }
			
			switch result {
			case .success(let favorites):
				if favorites.isEmpty {
					self.showEmptyStateView(with: "No Favorites?\nAdd one on the follower screen.", in: self.view)
				} else {
					self.favorites = favorites
					DispatchQueue.main.async {
						self.tableView.reloadData()
						self.view.bringSubviewToFront(self.tableView)
					}
				}
			case .failure(let error):
				self.presentSFSAlertOnMainThread(title: "Something went wrong!", message: error.rawValue, buttonTitle: "Ok")
			}
		}
	}
}

extension FavoritesController: UITableViewDataSource, UITableViewDelegate {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return favorites.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: FavoriteCell.resuseID) as! FavoriteCell
		let favorite = favorites[indexPath.row]
		
		cell.set(favorite: favorite)
		
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		let favorite = favorites[indexPath.row]
		let destVC = FollowerListController(username: favorite.login)
		
		navigationController?.pushViewController(destVC, animated: true)
	}
	
	func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
		guard editingStyle == .delete else {
			return
		}
		
		let favorite = favorites[indexPath.row]
		favorites.remove(at: indexPath.row)
		tableView.deleteRows(at: [indexPath], with: .left)
		
		PersistenceManager.updateWith(favorite: favorite, actionType: .remove) { [weak self] error in
			guard let self = self else { return }
			
			guard let error = error else { return }
			
			self.presentSFSAlertOnMainThread(title: "Unable to remove.", message: error.rawValue, buttonTitle: "Ok")
		}
	}
}
