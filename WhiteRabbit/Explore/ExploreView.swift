//
//  ExploreListView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import SwiftUI

struct ExploreView: View {
    
    @StateObject var exploreVM: ExploreViewModel
    
    @State private var showingSheet = false
    @State private var selectedShow: ShowDetails?

    // Function to fetch and set show details
    func selectShow(_ show: ShowsList) {
        exploreVM.fetchShowDetails(showID: show.id)
        // Delay the setting of selectedShow to ensure showDetail is updated
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            selectedShow = exploreVM.showDetail.first(where: { $0.id == show.id })
            print(selectedShow as Any)
        }
    }

    
    var body: some View {
        
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        
        NavigationView {
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
                            VStack {
                                ExploreDetailView(shows: show)
                                // TODO: - return details
//                                    .onTapGesture {
//                                        selectShow(show)
//                                        showingSheet.toggle()
//                                    }
//                                    .sheet(item: $selectedShow) { overview in
//                                        ShowSheetView(shows: overview)
//                                    }
                                Button {
                                    exploreVM.addShowToPersonalList(title: show.name)
                                    print(exploreVM.showTitles)
                                    
                                } label: {
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundStyle(.white, .white, .green)
                                }
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
        let exploreVM = ExploreViewModel()
        return ExploreView(exploreVM: exploreVM)
    }
}
