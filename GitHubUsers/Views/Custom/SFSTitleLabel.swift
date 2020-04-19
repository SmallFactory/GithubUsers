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
	
	convenience init(textAlign: NSTextAlignment, fontSize: CGFloat) {
		self.init(frame: .zero)
		self.textAlignment = textAlign
		self.font = UIFont.systemFont(ofSize: fontSize, weight: .bold)
	}
	
	private func configure() {
		adjustsFontSizeToFitWidth = true
		lineBreakMode = .byTruncatingTail
		minimumScaleFactor = 0.9
		textColor = .label
		translatesAutoresizingMaskIntoConstraints = false
	}
}
