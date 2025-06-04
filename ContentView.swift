//
//  ContentView.swift
//  Travel Itinerary
//
//  Created by Candice Cheung on 27/05/2025.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection) {
            HomeView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(systemName: "house")
                        Text("Home")
                    }
                }
                .tag(0)
        }
        .accentColor(.brown)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
