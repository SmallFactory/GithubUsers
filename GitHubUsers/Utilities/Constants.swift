//
//  Constants.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/17/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import UIKit

enum SFSymbols {
	static let gists = UIImage(systemName: "text.alignleft")
	static let followers = UIImage(systemName: "heart")
	static let following = UIImage(systemName: "person.2")
	static let location = UIImage(systemName: "mappin.and.ellipse")
	static let repos = UIImage(systemName: "folder")
}

enum Images {
	static let emptyStateLogo = UIImage(named: "empty-state-logo")
	static let ghLogo = UIImage(named: "gh-logo")
	static let placerholder = UIImage(named: "avatar-placeholder")
}

enum ScreenSize {
	static let width = UIScreen.main.bounds.size.width
	static let height = UIScreen.main.bounds.size.height
	static let maxLength = max(ScreenSize.width, ScreenSize.height)
	static let minLength = min(ScreenSize.width, ScreenSize.height)
}

enum DeviceTypes {
	static let idiom = UIDevice.current.userInterfaceIdiom
	static let nativeScale = UIScreen.main.nativeScale
	static let scale = UIScreen.main.scale
	
	static let isiPhoneSE = idiom == .phone && ScreenSize.maxLength == 568.0
	static let isiPhone8Standard = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale == scale
	static let isiPhone8Zoomed = idiom == .phone && ScreenSize.maxLength == 667.0 && nativeScale > scale
	static let isiPhonePlusStandard = idiom == .phone && ScreenSize.maxLength == 736.0
	static let isiPhone8PlusZoomed = idiom == .phone && ScreenSize.maxLength == 736.0 && nativeScale < scale
	static let isiPhoneX = idiom == .phone && ScreenSize.maxLength == 812.0
	static let isiPhoneXsMaxAndXr = idiom == .phone && ScreenSize.maxLength == 896.0
	static let isiPad = idiom == .pad && ScreenSize.maxLength >= 1024.0
	
	static func isiPhoneXAspectRatio() -> Bool {
		return isiPhoneX || isiPhoneXsMaxAndXr
	}
}
