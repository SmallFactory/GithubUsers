//
//  TabBarControllers.swift
//  GitHubUsers
//
//  Created by Small Factory Studios on 4/18/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class TabBarControllers: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
		UITabBar.appearance().tintColor = .systemGreen
		viewControllers = [createSearchNC(), createFavoritesNC()]
	}
    
	func createFavoritesNC() -> UINavigationController {
		let favoritesVC = FavoritesController()
		favoritesVC.title = "Favorites"
		favoritesVC.tabBarItem = UITabBarItem(tabBarSystemItem: .favorites, tag:1)
		return UINavigationController(rootViewController: favoritesVC)
	}
	
	func createSearchNC() -> UINavigationController {
		let searchVC = SearchController()
		searchVC.title = "Search"
		searchVC.tabBarItem = UITabBarItem(tabBarSystemItem: .search, tag:0)
		return UINavigationController(rootViewController: searchVC)
	}
}
