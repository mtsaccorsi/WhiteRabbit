//
//  ExploreListView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject private var exploreVM = ExploreViewModel()
    @State private var showingSheet = false
    @State private var selectedShow: ShowsList? = nil
    
    var body: some View {
        
        let columns = [GridItem(.flexible()), GridItem(.flexible())]

        NavigationStack {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "magnifyingglass.circle.fill")
                        .resizable()
                        .frame(width: 40, height: 40, alignment: .center)
                        .foregroundColor(Color.black.opacity(0.4))
                }
                .padding()
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(exploreVM.showsList, id: \.id) { show in
                            ExploreDetailView(shows: show)
                                .onTapGesture {
                                    selectedShow = show
                                    showingSheet.toggle()
                                }
                                .sheet(item: $selectedShow) { overview in
                                    ShowSheetView(shows: overview)
                                }
                        }
                    }
                }.task {exploreVM.fetchShows()}
            }
        }
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
