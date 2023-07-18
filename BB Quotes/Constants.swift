//
//  Constants.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

enum Constants {
	static let bbName = "Breaking Bad"
	static let bcsName = "Better Call Saul"
}

extension String {
	var replaceSpaceWithPlus: String {
		self.replacingOccurrences(of: " ", with: "+")
	}
	
	var noSpaces: String {
		self.replacingOccurrences(of: " ", with: "")
	}
	
	var lowerNoSpaces: String {
		self.noSpaces.lowercased()
	}
}
