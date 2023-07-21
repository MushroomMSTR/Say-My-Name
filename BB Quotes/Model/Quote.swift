//
//  Quote.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

// MARK: - Quote Structure
// This struct is used to decode the JSON data into a Quote object.
struct Quote: Decodable {
	// The quote string from the character.
	let quote: String
	
	// The name of the character who said the quote.
	let character: String
	
	// The production or episode where the quote is from.
	let production: String
}
