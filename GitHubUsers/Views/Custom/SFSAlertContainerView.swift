//
//  SFSAlertContainerView.swift
//  GitHubUsers
//
//  Created by Small Factory Studios on 4/18/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SFSAlertContainerView: UIView {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	private func configure() {
		backgroundColor = .systemBackground
		layer.borderColor = UIColor.white.cgColor
		layer.borderWidth = 2.0
		layer.cornerRadius = 16
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}
