//
//  QuoteView.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

// MARK: - QuoteView Struct
// This struct defines a view that displays a random quote from a specified TV show.
struct QuoteView: View {
	// The ViewModel object that manages the fetching and processing of data.
	@StateObject private var viewModel = ViewModel(controller: FetchController())
	
	// A boolean state that determines whether to show the character information sheet.
	@State private var showCharacterInfo = false
	
	// The name of the TV show to fetch quotes from.
	let show: String
	
	var body: some View {
		GeometryReader { geo in  // Provides access to the size of the parent container.
			ZStack {  // Allows overlaying views on top of each other.
				// The background image of the view.
				Image(show.lowerNoSpaces)
					.resizable()
					.frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
				
				// The content of the view.
				VStack {
					VStack {
						Spacer(minLength: 150)
						
						// The quote and character image, or a placeholder while loading.
						switch viewModel.status {
						case .success(let data):
							// The quote text.
							Text("\"\(data.quote.quote)\"")
								.minimumScaleFactor(0.5)
								.multilineTextAlignment(.center)
								.foregroundColor(.white)
								.padding()
								.background(.black.opacity(0.6))
								.cornerRadius(25)
								.padding(.horizontal)
							
							// The character image.
							ZStack(alignment: .bottom) {
								AsyncImage(url: data.character.images[0]) { image in
									image
										.resizable()
										.scaledToFill()
								} placeholder: {
									ProgressView()
								}
								.frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
								.onTapGesture {
									showCharacterInfo.toggle()
								}
								.sheet(isPresented: $showCharacterInfo) {
									CharacterView(show: show, character: data.character)
								}
								
								// The character's name.
								Text(data.quote.character)
									.foregroundColor(.white)
									.padding(10)
									.frame(maxWidth: .infinity)
									.background(.ultraThinMaterial)
							}
							.frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
							.cornerRadius(70)
							
						case .fetching:
							// While fetching, show a progress view.
							ProgressView()
							
						default:
							// In case of an error or before fetching, show an empty view.
							EmptyView()
						}
						
						Spacer()
					}
					
					// The button for fetching a new quote.
					Button {
						Task {
							await viewModel.getData(for: show)
						}
					} label: {
						Text("Get Random Quote")
							.font(.title)
							.foregroundColor(.white)
							.padding()
							.background(Color("\(show.noSpaces)Button"))
							.cornerRadius(7)
							.shadow(color: Color("\(show.noSpaces)Shadow"),radius: 2)
					}
					
					Spacer(minLength: 210)
				}
				.frame(width: geo.size.width)
			}
			.frame(width: geo.size.width, height: geo.size.height)
		}
		.ignoresSafeArea()  // Makes the view extend into the safe area.
		.onAppear {
			// Fetches a quote when the view appears.
			Task {
				await viewModel.getData(for: show)
			}
		}
	}
}

// MARK: - QuoteView Previews
// This struct provides previews of the QuoteView.
struct QuoteView_Previews: PreviewProvider {
	static var previews: some View {
		QuoteView(show: Constants.bbName)
		QuoteView(show: Constants.bcsName)
	}
}
