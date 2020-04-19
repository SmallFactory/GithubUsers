//
//  User.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/16/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import Foundation

struct User: Codable {
	let avatarUrl: String
	var bio: String?
	let createdAt: Date
	let following: Int
	let followers: Int
	let htmlUrl: String
	var location: String?
	let login: String
	var name: String?
	let publicRepos: Int
	let publicGists: Int
}
