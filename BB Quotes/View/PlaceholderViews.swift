//
//  PlaceholderViews.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

// MARK: - PlaceholderQuoteView Struct
// This struct defines a placeholder view that is displayed while a quote is being fetched.
struct PlaceholderQuoteView: View {
	var body: some View {
		Text("Loading quote...")  // The placeholder text.
			.foregroundColor(.white)  // The color of the placeholder text.
			.padding()  // Add padding around the placeholder text.
			.background(Color("BreakingBadButton").opacity(0.1))  // The background color of the placeholder view.
			.cornerRadius(25)  // Round the corners of the placeholder view.
			.padding(.horizontal)  // Add horizontal padding around the placeholder view.
	}
}

// MARK: - PlaceholderImageView Struct
// This struct defines a placeholder view that is displayed while an image is being fetched.
struct PlaceholderImageView: View {
	var body: some View {
		Color.gray  // The color of the placeholder view.
			.frame(width: 250, height: 250)  // The size of the placeholder view.
			.cornerRadius(70)  // Round the corners of the placeholder view.
			.opacity(0.1)  // The opacity of the placeholder view.
	}
}

// MARK: - PlaceholderViews Previews
// This struct provides previews of the placeholder views.
struct PlaceholderViews_Previews: PreviewProvider {
	static var previews: some View {
		Group {  // A group of views.
			PlaceholderQuoteView()  // Preview of the placeholder quote view.
			PlaceholderImageView()  // Preview of the placeholder image view.
		}
	}
}
