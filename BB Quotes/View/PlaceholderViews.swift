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
			.background(Color("BBGreen").opacity(0.6))
			.cornerRadius(25)
			.padding(.horizontal)
	}
}

struct PlaceholderImageView: View {
	var body: some View {
		Color.gray
			.frame(width: 200, height: 200)
			.cornerRadius(70)
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
