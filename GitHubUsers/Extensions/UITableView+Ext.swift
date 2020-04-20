//
//  UITableView+Ext.swift
//  GitHubUsers
//
//  Created by Small Factory Studios on 4/19/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

extension UITableView {

	func reloadDataOnMainThread() {
		DispatchQueue.main.async {
			self.reloadData()
		}
	}
	
	func removeExcessCells() {
		tableFooterView = UIView(frame: .zero)
	}
	
}
