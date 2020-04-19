//
//  PersistenceManager.swift
//  TakeHomeProject
//
//  Created by Small Factory Studios on 4/18/20.
//  Copyright © 2020 Small Factory Studios. All rights reserved.
//

import Foundation

enum PersistenceManager {
	static private let defaults = UserDefaults.standard
	
	enum PersistenceActionType {
		case add, remove
	}
	
	enum Keys {
		static let favorites = "favorites"
	}
	
	static func updateWith(favorite: Follower, actionType: PersistenceActionType, completed: @escaping (SFSError?) -> Void) {
		retrieveFavorites { result in
			switch result {
			case .success(let favorites):
				var retrievedFavorites = favorites
				
				switch actionType {
				case .add:
					guard !retrievedFavorites.contains(favorite) else {
						completed(.alreadyInFavorites)
						return
					}
					
					retrievedFavorites.append(favorite)
					
					break
				case .remove:
					retrievedFavorites.removeAll { $0.login == favorite.login }
				}
				
				completed(save(favorites: retrievedFavorites))
				
			case .failure(let error):
				completed(error)
			}
		}
	}
	
	static func retrieveFavorites(completed: @escaping (Result<[Follower], SFSError>) -> Void) {
		guard let favoritesData = defaults.object(forKey: Keys.favorites) as? Data else {
			completed(.success([]))
			return
		}
		
		do {
			let decoder = JSONDecoder()
			let favorites = try decoder.decode([Follower].self, from: favoritesData)
			completed(.success(favorites))
		} catch {
			completed(.failure(.unableToFavorite))
		}
	}
	
	static func save(favorites: [Follower]) -> SFSError? {
		
		do {
			let encoder = JSONEncoder()
			let encodedFavorites = try encoder.encode(favorites)
			defaults.set(encodedFavorites, forKey: Keys.favorites)
			return nil
		} catch {
			return .unableToFavorite
		}
	}
}
