//
//  Character.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

// MARK: - Character Structure
// This struct is used to decode the JSON data into a Character object.
struct Character: Decodable {
	// The name of the character.
	let name: String
	
	// The birthday of the character.
	let birthday: String
	
	// The occupations that the character has had.
	let occupations: [String]
	
	// URLs to images of the character.
	let images: [URL]
	
	// The aliases that the character has used.
	let aliases: [String]
	
	// The actor who portrayed the character.
	let portrayedBy: String
}
