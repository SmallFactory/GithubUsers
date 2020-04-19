//
//  FollowerCell.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/16/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class FollowerCell: UICollectionViewCell {
    static let resuseID = "FollowerCell"
	
	let avatarImageView = AvatarImageView(frame: .zero)
	let padding: CGFloat = 8
	let usernameLabel = SFSTitleLabel(textAlign: .center, fontSize: 16)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		compose()
		constrain()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func compose() {
		contentView.addSubview(avatarImageView)
		contentView.addSubview(usernameLabel)
	}
	
	func set(follower: Follower) {
		usernameLabel.text = follower.login
		avatarImageView.downloadImage(from: follower.avatarUrl)
	}
	
	private func constrain() {
		NSLayoutConstraint.activate([
			avatarImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: padding),
			avatarImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			avatarImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			avatarImageView.heightAnchor.constraint(equalTo: avatarImageView.widthAnchor),
			
			usernameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: 12),
			usernameLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: padding),
			usernameLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -padding),
			usernameLabel.heightAnchor.constraint(equalToConstant: 20)
		])
	}
}
