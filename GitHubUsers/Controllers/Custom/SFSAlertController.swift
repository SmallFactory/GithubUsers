//
//  SFSAlertController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/15/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SFSAlertController: UIViewController {

	let containerView = UIView()
	let titleLabel = SFSTitleLabel(textAlign: .center, fontSize: 20)
	let messageLabel = SFSBodyLabel(textAlign: .center)
	let actionButton = SFSButton(backgroundColor: .systemPink, title: "Ok")
	
	var alertTitle: String?
	var buttonTitle: String?
	var message: String?
	
	let padding: CGFloat = 20
	
	init(title: String, message: String, buttonTitle: String) {
		super.init(nibName: nil, bundle: nil)
		
		self.alertTitle = title
		self.buttonTitle = buttonTitle
		self.message = message
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        compose()
		constrain()
    }
	
	private func compose() {
		view.backgroundColor = UIColor.init(red: 0, green: 0, blue: 0, alpha: 0.75)
		view.addSubview(containerView)
		containerView.addSubview(titleLabel)
		containerView.addSubview(actionButton)
		containerView.addSubview(messageLabel)
		
		containerView.backgroundColor = .systemBackground
		containerView.layer.borderColor = UIColor.white.cgColor
		containerView.layer.borderWidth = 2.0
		containerView.layer.cornerRadius = 16
		containerView.translatesAutoresizingMaskIntoConstraints = false
		
		titleLabel.text = alertTitle ?? "Something went wrong"
		actionButton.setTitle(buttonTitle ?? "Ok", for: .normal)
		actionButton.addTarget(self, action: #selector(dismissVC), for: .touchUpInside)
		messageLabel.text = message ?? "Unable to complete request"
		messageLabel.numberOfLines = 4
	}
	
	private func constrain() {
		NSLayoutConstraint.activate([
			containerView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
			containerView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
			containerView.widthAnchor.constraint(equalToConstant: 280),
			containerView.heightAnchor.constraint(equalToConstant: 280),
			
			titleLabel.topAnchor.constraint(equalTo: containerView.topAnchor, constant: padding),
			titleLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
			titleLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
			titleLabel.heightAnchor.constraint(equalToConstant: 28),
			
			actionButton.bottomAnchor.constraint(equalTo: containerView.bottomAnchor, constant: -padding),
			actionButton.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
			actionButton.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
			actionButton.heightAnchor.constraint(equalToConstant: 44),
			
			messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 8),
			messageLabel.leadingAnchor.constraint(equalTo: containerView.leadingAnchor, constant: padding),
			messageLabel.trailingAnchor.constraint(equalTo: containerView.trailingAnchor, constant: -padding),
			messageLabel.bottomAnchor.constraint(equalTo: actionButton.topAnchor, constant: 8)
		])
	}
	
	@objc func dismissVC() {
		dismiss(animated: true)
	}
}
