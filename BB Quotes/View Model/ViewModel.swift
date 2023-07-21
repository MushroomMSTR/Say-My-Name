//
//  ViewModel.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

// MARK: - ViewModel Class
// This class manages the fetching of data and updates the view with the current status of the fetch.
@MainActor
class ViewModel: ObservableObject {
	// MARK: - Status Enumeration
	// This enum represents the various states the data fetch can be in.
	enum Status {
		case notStarted
		case fetching
		case success(data: (quote: Quote, character: Character))
		case failed(error: Error)
	}
	
	// The current status of the data fetch, published so the view can observe it.
	@Published private(set) var status: Status = .notStarted
	
	// The FetchController used to fetch the data.
	private let controller: FetchController
	
	// MARK: - Initialization
	// Initializes a ViewModel with a given FetchController.
	init(controller: FetchController) {
		self.controller = controller
	}
	
	// MARK: - Fetch Data Function
	// This function fetches a quote and a character from a given show and updates the status accordingly.
	func getData(for show: String) async {
		// Start fetching data.
		status = .fetching
		
		do {
			// Fetch a quote from the given show.
			let quote = try await controller.fetchQuote(from: show)
			
			// Fetch the character who said the quote.
			let character = try await controller.fetchCharacter(quote.character)
			
			// If both fetches succeed, set the status to success with the fetched data.
			status = .success(data: (quote, character))
		} catch {
			// If either fetch fails, set the status to failed with the error.
			status = .failed(error: error)
		}
	}
}
