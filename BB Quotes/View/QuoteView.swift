//
//  QuoteView.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

struct QuoteView: View {
	
	@StateObject private var viewModel = ViewModel(controller: FetchController())
	let show: String
	
	var body: some View {
		GeometryReader { geo in
			ZStack {
				Image(show.lowercased().filter { $0 != " "})
					.resizable()
					.frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
				
				VStack {
					Spacer(minLength: 150)
					
					switch viewModel.status {
					case .success(let data):
						Text("\"\(data.quote.quote)\"")
							.minimumScaleFactor(0.5)
							.multilineTextAlignment(.center)
							.foregroundColor(.white)
							.padding()
							.background(Color("BBGreen").opacity(0.6))
							.cornerRadius(25)
							.padding(.horizontal)
						
						ZStack(alignment: .bottom) {
							AsyncImage(url: data.character.images[0]) { image in
								image
									.resizable()
									.scaledToFill()
							} placeholder: {
								ProgressView()
							}
							.frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
							
							Text(data.quote.character)
								.foregroundColor(.white)
								.padding(10)
								.frame(maxWidth: .infinity)
								.background(.ultraThinMaterial)
						}
						.frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
						.cornerRadius(70)
						
					case .fetching:
						ProgressView()
						
					default:
						EmptyView()
					}
					
					Spacer()
					
					Button {
						Task {
							await viewModel.getData(for: show) // When I press the button, I don't see the result. A quote and an image of a character from the series should appear, but it doesn't, what could be the problem?
						}
					} label: {
						Text("Get Random Quote")
						.font(.title)
						.foregroundColor(.white)
						.padding()
						.background(Color("BBGreen"))
						.cornerRadius(7)
						.shadow(color: Color("BBOrange"),radius: 2)
					}
					
					Spacer(minLength: 210)
				}
				.frame(width: geo.size.width)
			}
			.frame(width: geo.size.width, height: geo.size.height)
		}
		.ignoresSafeArea()
	}
}

struct QuoteView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteView(show: "Breaking Bad")
	}
}
