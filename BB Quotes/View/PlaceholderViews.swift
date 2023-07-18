//
//  PlaceholderViews.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

struct PlaceholderQuoteView: View {
	var body: some View {
		Text("Loading quote...")
			.foregroundColor(.white)
			.padding()
			.background(Color("BreakingBadButton").opacity(0.1))
			.cornerRadius(25)
			.padding(.horizontal)
	}
}

struct PlaceholderImageView: View {
	var body: some View {
		Color.gray
			.frame(width: 250, height: 250)
			.cornerRadius(70)
			.opacity(0.1)
	}
}


struct PlaceholderViews_Previews: PreviewProvider {
    static var previews: some View {
		Group {
			PlaceholderQuoteView()
			PlaceholderImageView()
		}
    }
}
