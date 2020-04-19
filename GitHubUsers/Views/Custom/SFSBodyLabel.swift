//
//  SFSBodyLabel.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/15/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SFSBodyLabel: UILabel {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	convenience init(textAlign: NSTextAlignment) {
		self.init(frame: .zero)
		self.textAlignment = textAlign
	}
	
	private func configure() {
		adjustsFontSizeToFitWidth = true
		font = UIFont.preferredFont(forTextStyle: .body)
		lineBreakMode = .byWordWrapping
		minimumScaleFactor = 0.75
		textColor = .secondaryLabel
		translatesAutoresizingMaskIntoConstraints = false
	}
}
