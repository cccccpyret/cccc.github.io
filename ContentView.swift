//
//  ContentView.swift
//  travelitineray
//
//  Created by Candice Cheung on 20/05/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var selection = 0
    
    var body: some View {
        TabView(selection: $selection){
            HomeView()
                .font(.title)
                .tabItem {
                    VStack {
                        Image(NSDataAssetName("Home"),
                              Text("Home")
                        )
                    }
                    
                    struct ViewBuilder:
                        PreviewProvider {
                        static var previews: some View {
                            ContentView()
                        }
                    }
                }
        }
    }
}
