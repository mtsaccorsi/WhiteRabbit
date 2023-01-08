//
//  HomeView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        TabView() {
            
            PersonalListView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Início")
                }
            
            ExploreView()
                .tabItem {
                    Image(systemName: "globe")
                    Text("Explorar")
                }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
