//
//  AvatarImageView.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/16/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class AvatarImageView: UIImageView {
	
	let cache = NetworkManager.shared.cache
	let placeholderImage = Images.placerholder
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		clipsToBounds = true
		image = placeholderImage
		layer.cornerRadius = 10
		translatesAutoresizingMaskIntoConstraints = false
	}
}
