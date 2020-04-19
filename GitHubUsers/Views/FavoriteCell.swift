//
//  FavoriteCell.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/18/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class FavoriteCell: UITableViewCell {
	static let resuseID = "FavoriteCell"
	
	let avatarImageView = AvatarImageView(frame: .zero)
	let usernameLabel = SFSTitleLabel(textAlign: .left, fontSize: 26)
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		compose()
		constrain()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func compose() {
		addSubview(avatarImageView)
		addSubview(usernameLabel)
		
		accessoryType = .disclosureIndicator
	}
	
	func set(favorite: Follower) {
		usernameLabel.text = favorite.login
		NetworkManager.shared.downloadImage(from: favorite.avatarUrl) { [weak self] image in
			guard let self = self else { return }
			DispatchQueue.main.async {
				self.avatarImageView.image = image
			}
		}
	}
	
	private func constrain() {
		let padding: CGFloat = 12
		
		NSLayoutConstraint.activate([
			avatarImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
			avatarImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: padding),
			avatarImageView.heightAnchor.constraint(equalToConstant: 60),
			avatarImageView.widthAnchor.constraint(equalToConstant: 60),
			
			usernameLabel.centerYAnchor.constraint(equalTo: centerYAnchor),
			usernameLabel.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: 24),
			usernameLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -padding),
			usernameLabel.heightAnchor.constraint(equalToConstant: 40)
		])
	}
}
