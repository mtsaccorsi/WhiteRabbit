//
//  HomeView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import SwiftUI

struct HomeView: View {
    @StateObject var exploreVM = ExploreViewModel()
    
    var body: some View {
        TabView() {
            
            PersonalListView(exploreVM: exploreVM)
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Início")
                }

            
            ExploreView(exploreVM: exploreVM)
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
