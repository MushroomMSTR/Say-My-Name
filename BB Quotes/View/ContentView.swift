//
//  ContentView.swift
//  BB Quotes
//
//  Created by NazarStf on 18.07.2023.
//

import SwiftUI

// MARK: - ContentView Struct
// This struct defines the main view of the app, which includes a TabView with two tabs.
struct ContentView: View {
	var body: some View {
		// Create a TabView with two tabs.
		TabView {
			// First tab displays quotes from Breaking Bad.
			QuoteView(show: Constants.bbName)
				.tabItem {
					// The tab item label is the name of the show with a tortoise icon.
					Label(Constants.bbName, systemImage: "tortoise")
				}
			// Second tab displays quotes from Better Call Saul.
			QuoteView(show: Constants.bcsName)
				.tabItem {
					// The tab item label is the name of the show with a briefcase icon.
					Label(Constants.bcsName, systemImage: "briefcase")
				}
		}
		// When the view appears, set the scroll edge appearance of the tab bar to the default appearance.
		.onAppear {
			UITabBar.appearance().scrollEdgeAppearance = UITabBarAppearance()
		}
	}
}

// MARK: - ContentView Previews
// This struct provides previews of the ContentView.
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		ContentView()
	}
}
