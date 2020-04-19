//
//  DataLoadingController.swift
//  GitHubUsers
//
//  Created by Small Factory Studios on 4/19/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class DataLoadingController: UIViewController {

	private var containerView: UIView!
	
    override func viewDidLoad() {
        super.viewDidLoad()
	}
	
	func showLoadingView() {
		containerView = UIView(frame: view.bounds)
		view.addSubview(containerView)
		
		containerView.alpha = 0
		containerView.backgroundColor = .systemBackground
		
		UIView.animate(withDuration: 0.25) {
			self.containerView.alpha = 0.8
		}
		
		let activityIndicator = UIActivityIndicatorView(style: .large)
		containerView.addSubview(activityIndicator)
		activityIndicator.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			activityIndicator.centerYAnchor.constraint(equalTo: containerView.centerYAnchor),
			activityIndicator.centerXAnchor.constraint(equalTo: containerView.centerXAnchor)
		])
		activityIndicator.startAnimating()
	}
	
	func dismissLoadingView() {
		DispatchQueue.main.async {
			self.containerView.removeFromSuperview()
			self.containerView = nil
		}
	}
	
	func showEmptyStateView(with message: String, in view: UIView) {
		let emptyStateView = EmptyStateView(message: message)
		emptyStateView.frame = view.bounds
		view.addSubview(emptyStateView)
	}
}
