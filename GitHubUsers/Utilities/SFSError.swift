//
//  SFSError.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/16/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import Foundation

enum SFSError: String, Error {
	case alreadyInFavorites = "You've already favorited this user."
	case invalidData = "The data received from the server was invalid, please try again."
	case invalidResponse = "Invalid response from the server, please try again."
	case invalidUsername = "This username created an invalid request, please try again."
	case unableToComplete = "Unable to complete your request please check your internet connection."
	case unableToFavorite = "There was an error favoriting this user, please try again"
}
