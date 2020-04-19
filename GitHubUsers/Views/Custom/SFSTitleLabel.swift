//
//  SFSTitleLabel.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/15/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SFSTitleLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(textAlign: NSTextAlignment, fontSize: CGFloat) {
		super.init(frame: .zero)
		self.textAlignment = textAlign
		self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
		configure()
	}
	
	private func configure() {
		adjustsFontSizeToFitWidth = true
		lineBreakMode = .byTruncatingTail
		minimumScaleFactor = 0.9
		textColor = .label
		translatesAutoresizingMaskIntoConstraints = false
	}
}
