//
//  FetchController.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

// MARK: - Network Error Enumeration
// This enum defines possible errors that can occur while fetching data from the network.
struct FetchController {
	enum NetworkError: Error {
		case badURL, badResponse
	}
	
	// Base URL for the Breaking Bad API.
	private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
	
	// MARK: - Fetch Quote Function
	// This function fetches a random quote from a specified show from the Breaking Bad API.
	func fetchQuote(from show: String) async throws -> Quote {
		// Append the path for fetching quotes to the base URL.
		let quoteURL = baseURL.appending(path: "quotes/random")
		var quoteComponents = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)
		// Create a query item for the show name, replacing spaces with plus signs.
		let quoteQueryItem = URLQueryItem(name: "production", value: show.replaceSpaceWithPlus)
		
		// Set the query items for the URL components.
		quoteComponents?.queryItems = [quoteQueryItem]
		
		// Make sure the URL is valid.
		guard let fetchURL = quoteComponents?.url else {
			throw NetworkError.badURL
		}
		
		// Fetch the data from the URL.
		let (data, responce) = try await URLSession.shared.data(from: fetchURL)
		
		// Make sure the response status code is 200 (OK).
		guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
			throw NetworkError.badResponse
		}
		
		// Decode the fetched data into a Quote object.
		let quote = try JSONDecoder().decode(Quote.self, from: data)
		
		// Return the quote.
		return quote
	}
	
	// MARK: - Fetch Character Function
	// This function fetches a character by name from the Breaking Bad API.
	func fetchCharacter(_ name: String) async throws -> Character {
		// Append the path for fetching characters to the base URL.
		let characterURL = baseURL.appending(path: "characters")
		var characterComponents = URLComponents(url: characterURL, resolvingAgainstBaseURL: true)
		// Create a query item for the character name, replacing spaces with plus signs.
		let characterQueryItem = URLQueryItem(name: "name", value: name.replaceSpaceWithPlus)
		characterComponents?.queryItems = [characterQueryItem]
		
		// Make sure the URL is valid.
		guard let fetchURL = characterComponents?.url else {
			throw NetworkError.badURL
		}
		
		// Fetch the data from the URL.
		let (data, responce) = try await URLSession.shared.data(from: fetchURL)
		
		// Make sure the response status code is 200 (OK).
		guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
			throw NetworkError.badResponse
		}
		
		// Decode the fetched data into an array of Character objects.
		let decoder = JSONDecoder()
		decoder.keyDecodingStrategy = .convertFromSnakeCase
		
		let characters = try decoder.decode([Character].self, from: data)
		
		// Return the first character in the array.
		return characters[0]
	}
}
