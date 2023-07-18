//
//  Constants.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import Foundation

extension String {
	var replaceSpaceWithPlus: String {
		self.replacingOccurrences(of: " ", with: "+")
	}
}
