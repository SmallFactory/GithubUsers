//
//  SceneDelegate.swift
//  GitHubUsers
//
//  Created by Small Factory Studios on 4/18/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

	var window: UIWindow?


	func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
		guard let windowScene = (scene as? UIWindowScene) else { return }
		
		window = UIWindow(frame: windowScene.coordinateSpace.bounds)
        window?.windowScene = windowScene
		window?.rootViewController = createTabBar()
		window?.makeKeyAndVisible()
		
		configureNavigationBar()
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
	
	func createTabBar() -> UITabBarController {
		let tabBar = UITabBarController()
		UITabBar.appearance().tintColor = .systemGreen
		tabBar.viewControllers = [createSearchNC(), createFavoritesNC()]
		return tabBar
	}

	func configureNavigationBar() {
		UINavigationBar.appearance().tintColor = .systemGreen
	}
	
	func sceneDidDisconnect(_ scene: UIScene) {
	}

	func sceneDidBecomeActive(_ scene: UIScene) {
	}

	func sceneWillResignActive(_ scene: UIScene) {
	}

	func sceneWillEnterForeground(_ scene: UIScene) {
	}

	func sceneDidEnterBackground(_ scene: UIScene) {
	}
}