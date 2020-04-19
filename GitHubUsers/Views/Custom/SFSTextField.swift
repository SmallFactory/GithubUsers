//
//  SFSTextField.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/14/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SFSTextField: UITextField {

	override init(frame: CGRect) {
		super.init(frame: frame)
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	private func configure() {
		translatesAutoresizingMaskIntoConstraints = false
		layer.borderColor = UIColor.systemGray4.cgColor
		layer.borderWidth = 2
		layer.cornerRadius = 10
		
		textColor = .label
		tintColor = .label
		textAlignment = .center
		font = UIFont.preferredFont(forTextStyle: .title2)
		adjustsFontSizeToFitWidth = true
		minimumFontSize = 12
		
		autocorrectionType = .no
		backgroundColor = .tertiarySystemBackground
		clearButtonMode = .whileEditing
		returnKeyType = .go
		
		placeholder = "Enter a username"
	}
}
