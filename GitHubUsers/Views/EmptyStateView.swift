//
//  EmptyStateView.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/16/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class EmptyStateView: UIView {
		
	let messageLabel = SFSTitleLabel(textAlign: .center, fontSize: 28)
	let logoImageView = UIImageView()

	override init(frame: CGRect) {
		super.init(frame: frame)
		compose()
		constrain()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(message: String) {
		self.init(frame: .zero)
		messageLabel.text = message
	}
	
	private func compose() {
		addSubview(messageLabel)
		addSubview(logoImageView)
		
		messageLabel.numberOfLines = 3
		messageLabel.textColor = .secondaryLabel
		
		logoImageView.image = Images.emptyStateLogo
		logoImageView.translatesAutoresizingMaskIntoConstraints = false
	}
		
	private func constrain() {
		let labelCenterYConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? -80 : -150
		
		let messageLabelCenterYConstraint = messageLabel.centerYAnchor.constraint(equalTo: self.centerYAnchor, constant: labelCenterYConstant)
		messageLabelCenterYConstraint.isActive = true
		
		let logoBottomConstant: CGFloat = DeviceTypes.isiPhoneSE || DeviceTypes.isiPhone8Zoomed ? 80 : 40
		
		let logoImageViewBottomConstraint = logoImageView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: logoBottomConstant)
		logoImageViewBottomConstraint.isActive = true
		
		NSLayoutConstraint.activate([
			messageLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
			messageLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
			messageLabel.heightAnchor.constraint(equalToConstant: 200),
			
			logoImageView.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
			logoImageView.heightAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1.3),
			logoImageView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 170)
		])
	}
}
