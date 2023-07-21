//
//  CharacterView.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

// MARK: - CharacterView Struct
// This struct defines a view that displays detailed information about a character.
struct CharacterView: View {
	// The name of the TV show the character is from.
	let show: String
	
	// The character whose details to display.
	let character: Character
	
	var body: some View {
		GeometryReader { geo in  // Provides access to the size of the parent container.
			ZStack(alignment: .top) {  // Allows overlaying views on top of each other.
				// The background image of the view.
				Image(show.lowerNoSpaces)
					.resizable()
					.scaledToFit()
				
				ScrollView {  // Allows scrolling through the content.
					// The character's image.
					VStack {
						AsyncImage(url: character.images.randomElement()) { image in
							image
								.resizable()
								.scaledToFill()
						} placeholder: {
							ProgressView()  // Shown while the image is loading.
						}
					}
					.frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
					.cornerRadius(25)
					.padding(.top, 60)
					
					// The character's information.
					VStack(alignment: .leading) {
						Group {
							// The character's name.
							Text(character.name)
								.font(.largeTitle)
							
							// Who the character is portrayed by.
							Text("Portrayed by: \(character.portrayedBy)")
								.font(.subheadline)
							
							Divider()  // A line separating sections of content.
							
							// Header for the character's info section.
							Text("\(character.name) Character Info")
								.font(.title2)
							
							// The character's birthdate.
							Text("Born: \(character.birthday)")
							
							Divider()
							
							// The character's occupations.
							Text("Occupations:")
							ForEach(character.occupations, id:\.self) { occupation in
								Text("•\(occupation)")
									.font(.subheadline)
							}
							
							Divider()
						}
						
						Group {
							// The character's aliases or nicknames.
							Text("Nicknames:")
							if character.aliases.count > 0 {
								ForEach(character.aliases, id:\.self) { alias in
									Text("•\(alias)")
										.font(.subheadline)
								}
							} else {
								Text("None")
									.font(.subheadline)
							}
						}
					}
					.padding([.leading, .bottom], 40)
				}
			}
		}
		.ignoresSafeArea()  // Makes the view extend into the safe area.
	}
}

// MARK: - CharacterView Previews
// This struct provides previews of the CharacterView.
struct CharacterView_Previews: PreviewProvider {
	static var previews: some View {
		CharacterView(show: Constants.bbName, character: Constants.previewCharacter)
	}
}
