//
//  QuoteView.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

struct QuoteView: View {
    var body: some View {
		GeometryReader { geo in
			ZStack {
				Image("breakingbad")
					.resizable()
					.frame(width: geo.size.width * 2.7, height: geo.size.height * 1.2)
				
				VStack {
					Spacer(minLength: 150)
					
					Text("\"You either run from things, or you face them, Mr. White\"")
						.minimumScaleFactor(0.5)
						.multilineTextAlignment(.center)
						.foregroundColor(.white)
						.padding()
						.background(Color("BBGreen").opacity(0.6))
						.cornerRadius(25)
						.padding(.horizontal)
					
					ZStack(alignment: .bottom) {
						Image("jessepinkman")
							.resizable()
							.scaledToFill()
						
						Text("Jesse Pinkman")
							.foregroundColor(.white)
							.padding(10)
							.frame(maxWidth: .infinity)
							.background(.ultraThinMaterial)
					}
					.frame(width: geo.size.width/1.1, height: geo.size.height/1.8)
					.cornerRadius(70)
					
					Spacer()
					
					Button {
						
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
        QuoteView()
    }
}
