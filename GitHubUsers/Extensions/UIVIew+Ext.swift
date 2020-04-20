//
//  UIVIew+Ext.swift
//  GitHubUsers
//
//  Created by Small Factory Studios on 4/19/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

extension UIView {
	
	func addSubviews(_ views: UIView...) {
		for view in views {
			addSubview(view)
		}
	}
}
