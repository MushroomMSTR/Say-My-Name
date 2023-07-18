//
//  CharacterView.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

struct CharacterView: View {
	var body: some View {
		GeometryReader { geo in
			ZStack(alignment: .top) {
				// Back
				Image("breakingbad")
					.resizable()
					.scaledToFit()
				ScrollView {
					// Character Image
					VStack {
						Image("jessepinkman")
							.resizable()
							.scaledToFill()
					}
					.frame(width: geo.size.width/1.2, height: geo.size.height/1.7)
					.cornerRadius(25)
					.padding(.top, 60)
					// Character Info
					VStack(alignment: .leading) {
						Group {
							Text("Jesse Pinkman")
								.font(.largeTitle)
							
							Text("Portrayed by: Aaron Paul")
								.font(.subheadline)
							
							Divider()
							
							Text("Jesse Pinkman Character Info")
								.font(.title2)
							
							Text("Born: 09-24-1984")
							
							Divider()
							
							Text("Occupations:")
							
							ForEach(0..<3) { i in
								Text("•Occupation \(i)")
									.font(.subheadline)
							}
							
							Divider()
						}
						
						Group {
							Text("Nicknames:")
							
							ForEach(0..<3) { i in
								Text("•Nickname \(i)")
									.font(.subheadline)
							}
						}
					}
					.padding([.leading, .bottom], 40)
				}
			}
		}
		.ignoresSafeArea()
	}
}

struct CharacterView_Previews: PreviewProvider {
	static var previews: some View {
		CharacterView()
	}
}
