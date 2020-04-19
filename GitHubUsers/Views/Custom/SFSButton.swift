//
//  SFSButton.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/14/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

class SFSButton: UIButton {
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		configure()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	init(backgroundColor: UIColor, title: String) {
		super.init(frame: .zero)
		self.backgroundColor = backgroundColor
		self.setTitle(title, for: .normal)
		
		configure()
	}
	
	private func configure() {
		layer.cornerRadius = 10
		titleLabel?.font = UIFont.preferredFont(forTextStyle: .headline)
		setTitleColor(.white, for: .normal)
		translatesAutoresizingMaskIntoConstraints = false
	}
	
	func set(backgroundColor: UIColor, title: String) {
		self.backgroundColor = backgroundColor
		setTitle(title, for: .normal)
	}
}