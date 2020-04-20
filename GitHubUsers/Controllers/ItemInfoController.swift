//
//  ItemInfoController.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class ItemInfoController: UIViewController {

	internal let actionButton = SFSButton()
	internal let itemInfoViewOne = ItemInfoView()
	internal let itemInfoViewTwo = ItemInfoView()
	private let stackView = UIStackView()
	
	var user: User!
	
	override func viewDidLoad() {
        super.viewDidLoad()

		compose()
		constrain()
	}
	
	init(user: User) {
		super.init(nibName: nil, bundle: nil)
		self.user = user
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func compose() {
		view.layer.cornerRadius = 18
		view.backgroundColor = .secondarySystemBackground
		
		view.addSubviews(stackView, actionButton)
		
		actionButton.addTarget(self, action: #selector(actionButtonTapped), for: .touchUpInside)
		
		stackView.translatesAutoresizingMaskIntoConstraints = false
		stackView.axis = .horizontal
		stackView.distribution = .equalSpacing
		
		stackView.addArrangedSubview(itemInfoViewOne)
		stackView.addArrangedSubview(itemInfoViewTwo)
	}
	
	private func constrain() {
		let padding: CGFloat = 20
		
		NSLayoutConstraint.activate([
			stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
			stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			stackView.heightAnchor.constraint(equalToConstant: 50),
			
			actionButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -padding),
			actionButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
			actionButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
			actionButton.heightAnchor.constraint(equalToConstant: 44)
			
		])
	}
	
	@objc func actionButtonTapped() { }
}
