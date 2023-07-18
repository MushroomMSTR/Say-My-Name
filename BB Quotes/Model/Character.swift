//
//  Character.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

struct Character: Decodable {
	let name: String
	let birthday: String
	let occupations: [String]
	let images: [URL]
	let alieases: [String]
	let portrayedBy: String
}
