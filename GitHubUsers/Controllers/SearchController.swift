//
//  SearchController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/14/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SearchController: UIViewController {
	
	let callToActionButton = SFSButton(backgroundColor: .systemGreen, title: "Get Followers")
	let logoImageView = UIImageView()
	var logoImageViewTopConstraint: NSLayoutConstraint!
	let usernameTextField = SFSTextField()
	
	var isUsernameEntered: Bool { return !usernameTextField.text!.isEmpty }
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .systemBackground
		
		compose()
		constrain()
		createDissmissKeyboardTapGesture()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		navigationController?.setNavigationBarHidden(true, animated: true)
		usernameTextField.text = ""
	}
	
	private func createDissmissKeyboardTapGesture() {
		let tap = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
		view.addGestureRecognizer(tap)
	}
	
	@objc func pushFollowerListVC() {
		guard isUsernameEntered else {
			presentSFSAlertOnMainThread(title: "Empty Username", message: "Please enter a username. We need to know who to look for 😀.", buttonTitle: "Ok")
			return
		}
		
		usernameTextField.resignFirstResponder()
		
		guard let username = usernameTextField.text else { return }
		let followerListVC = FollowerListController(username: username)

		navigationController?.pushViewController(followerListVC, animated: true)
	}
	
	private func compose() {
		view.addSubview(logoImageView)
		logoImageView.translatesAutoresizingMaskIntoConstraints = false
		logoImageView.image = Images.ghLogo
		
		view.addSubview(usernameTextField)
		usernameTextField.delegate = self
		
		view.addSubview(callToActionButton)
		callToActionButton.addTarget(self, action: #selector(pushFollowerListVC), for: .touchUpInside)
	}
	
	private func constrain() {
		let topConstraintConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 20 : 80
		logoImageViewTopConstraint = logoImageView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: topConstraintConstant)
		logoImageViewTopConstraint.isActive = true
		
		NSLayoutConstraint.activate([
			logoImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			logoImageView.heightAnchor.constraint(equalToConstant: 200),
			logoImageView.widthAnchor.constraint(equalToConstant: 200),
			
			usernameTextField.topAnchor.constraint(equalTo: logoImageView.bottomAnchor, constant: 48),
			usernameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			usernameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			usernameTextField.heightAnchor.constraint(equalToConstant: 50),
			
			callToActionButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
			callToActionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
			callToActionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -50),
			callToActionButton.heightAnchor.constraint(equalToConstant: 50)
		])
	}
}

extension SearchController: UITextFieldDelegate {
	func textFieldShouldReturn(_ textField: UITextField) -> Bool {
		pushFollowerListVC()
		return true
	}
}
