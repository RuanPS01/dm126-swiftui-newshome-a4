//
//  ContentView.swift
//  NewsHomeA3
//
//  Created by Ruan Patrick de Souza on 23/11/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            NavigationBar()
            ScrollView {
                CarouselTabView()
                Divider().frame(height: 20)
                FeaturesGrid()
                Divider().frame(height: 20)
                GoalContainer()
            }
            
        }
    }
}

#Preview {
    ContentView()
}
