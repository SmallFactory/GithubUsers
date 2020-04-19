//
//  SFSSecondaryTitleLabel.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SFSSecondaryTitleLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(fontSize: CGFloat) {
		super.init(frame: .zero)
		self.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
		configure()
	}
	
	private func configure() {
		adjustsFontSizeToFitWidth = true
		lineBreakMode = .byTruncatingTail
		minimumScaleFactor = 0.9
		textColor = .secondaryLabel
		translatesAutoresizingMaskIntoConstraints = false
	}
}
