//
//  ItemInfoView.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

enum ItemInfoType {
	case repos, gists, followers, following
}

class ItemInfoView: UIView {

	let symbolImageView = UIImageView()
	let titleLabel = SFSTitleLabel(textAlign: .left, fontSize: 14)
	let countLabel = SFSTitleLabel(textAlign: .center, fontSize: 14)
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		compose()
		constrain()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func compose() {
		addSubview(symbolImageView)
		addSubview(titleLabel)
		addSubview(countLabel)
		
		symbolImageView.translatesAutoresizingMaskIntoConstraints = false
		symbolImageView.contentMode = .scaleToFill
		symbolImageView.tintColor = .label
	}
	
	private func constrain() {
		NSLayoutConstraint.activate([
			symbolImageView.topAnchor.constraint(equalTo: topAnchor),
			symbolImageView.leadingAnchor.constraint(equalTo: leadingAnchor),
			symbolImageView.widthAnchor.constraint(equalToConstant: 20),
			symbolImageView.heightAnchor.constraint(equalToConstant: 20),
			
			titleLabel.centerYAnchor.constraint(equalTo: symbolImageView.centerYAnchor),
			titleLabel.leadingAnchor.constraint(equalTo: symbolImageView.trailingAnchor, constant: 12),
			titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			titleLabel.heightAnchor.constraint(equalToConstant: 18),
			
			countLabel.topAnchor.constraint(equalTo: symbolImageView.bottomAnchor, constant: 4),
			countLabel.leadingAnchor.constraint(equalTo: leadingAnchor),
			countLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
			countLabel.heightAnchor.constraint(equalToConstant: 18),
		])
	}
	
	func set(itemInfoType: ItemInfoType, with count: Int) {
		switch itemInfoType {
		case .repos:
			symbolImageView.image = SFSymbols.repos
			titleLabel.text = "Public Repos"
		case .gists:
			symbolImageView.image = SFSymbols.gists
			titleLabel.text = "Public Gists"
		case .followers:
			symbolImageView.image = SFSymbols.followers
			titleLabel.text = "Followers"
		case .following:
			symbolImageView.image = SFSymbols.following
			titleLabel.text = "Following"
		}
		countLabel.text = String(count)
	}
}
