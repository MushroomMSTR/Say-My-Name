//
//  Constants.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

// MARK: - Constants Enum
// This enum holds static constants that can be used throughout the app.
enum Constants {
	static let bbName = "Breaking Bad"  // The name of the Breaking Bad show.
	static let bcsName = "Better Call Saul"  // The name of the Better Call Saul show.
	
	// A preview character for use in SwiftUI previews.
	static let previewCharacter: Character = {
		let decoder = JSONDecoder()  // A JSON decoder.
		decoder.keyDecodingStrategy = .convertFromSnakeCase  // The decoding strategy for the decoder.
		
		// Try to load the sample character data from the bundle.
		let data = try! Data(contentsOf: Bundle.main.url(forResource: "samplecharacter", withExtension: "json")!)
		
		// Try to decode the character data into an array of Characters and return the first one.
		return try! decoder.decode([Character].self, from: data)[0]
	}()
}

// MARK: - String Extensions
// These extensions provide utility functions for strings.
extension String {
	// Replace spaces in a string with plus signs.
	var replaceSpaceWithPlus: String {
		self.replacingOccurrences(of: " ", with: "+")
	}
	
	// Remove spaces from a string.
	var noSpaces: String {
		self.replacingOccurrences(of: " ", with: "")
	}
	
	// Convert a string to lowercase and remove spaces.
	var lowerNoSpaces: String {
		self.noSpaces.lowercased()
	}
}
