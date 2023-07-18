//
//  ContentView.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

struct ContentView: View {
	var body: some View {
		TabView {
			QuoteView(show: Constants.bbName)
				.tabItem {
					Label(Constants.bbName, systemImage: "tortoise")
				}
			QuoteView(show: Constants.bcsName)
				.tabItem {
					Label(Constants.bcsName, systemImage: "briefcase")
				}
		}
		.onAppear {
			UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
		}
	}
}

struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
