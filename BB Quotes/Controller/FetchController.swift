//
//  FetchController.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

struct FetchController {
	enum NetworkError: Error {
		case badURL, badResponse
	}
	
	// https://breaking-bad-api-six.vercel.app/api/quotes/random?production=Breaking+Bad
	
	private let baseURL = URL(string: "https://breaking-bad-api-six.vercel.app/api")!
	
	func fetchQuote(from show: String) async throws -> Quote {
		let quoteURL = baseURL.appending(path: "quotes/random")
		var quoteComponents = URLComponents(url: quoteURL, resolvingAgainstBaseURL: true)
		let quoteQueryItem = URLQueryItem(name: "production", value: show.replacingOccurrences(of: " ", with: "+"))
		
		quoteComponents?.queryItems = [quoteQueryItem]
		
		guard let fetchURL = quoteComponents?.url else {
			throw NetworkError.badURL
		}
		
		let (data, responce) = try await URLSession.shared.data(from: fetchURL)
		
		guard let responce = responce as? HTTPURLResponse, responce.statusCode == 200 else {
			throw NetworkError.badResponse
		}
		
		let quote = try JSONDecoder().decode(Quote.self, from: data)
		
		return quote
	}
}
