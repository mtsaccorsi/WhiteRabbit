//
//  ExploreListView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import SwiftUI

// MARK: - LIST VIEW
struct ExploreView: View {
    
    @StateObject var exploreVM: ExploreViewModel
    
    @State private var showingSheet = false
    @State private var selectedShow: ShowDetails?
    @State private var showID: Int?
    
    func didDismiss() {
        selectedShow = nil
    }
    
    var body: some View {
        
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        // TODO: Add progress view
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
                
                PickerView(exploreVM: exploreVM)
                
                ScrollView {
                    if exploreVM.selectedMediaType == MediaType.series {
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(exploreVM.showsList, id: \.id) { show in
                                VStack {
                                    ShowView(shows: show)
                                    // get the ID and activates the sheet
                                        .onTapGesture {
                                            showID = show.id
                                            showingSheet.toggle()
                                        }
                                    // shows the sheet when selectedShow is fully loaded with the current ID
                                        .sheet(isPresented: $showingSheet, onDismiss: didDismiss) {
                                            if let selectedShow {
                                                ShowDetailView(showDetail: selectedShow)
                                            } else {
                                                ProgressView()
                                                    .onAppear {
                                                        if let showID {
                                                            exploreVM.fetchShowDetails(showID: showID) { showDetails in
                                                                selectedShow = showDetails
                                                            }
                                                        }
                                                    }
                                            }
                                        }
                                    
                                    
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
                        .task {exploreVM.fetchShows()}
                        
                        
                    } else {
                        LazyVGrid(columns: columns, spacing: 20){
                            ForEach(exploreVM.moviesList, id: \.id) { movie in
                                VStack {
                                    MovieView(movies: movie)
                                    // TODO: - get the ID and activates the sheet
                                    
                                    // TODO: - shows the sheet when selectedShow is fully loaded with the current ID
                                       
                                    Button {
                                        exploreVM.addMovieToPersonalList(title: movie.title)
                                        print(exploreVM.movieTitles)
                                        
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundStyle(.white, .white, .green)
                                    }
                                }
                                
                            }
                        }.task {exploreVM.fetchMovies()}
                    }
                }
            }
        }
    }
}

// MARK: - PICKER VIEW
struct PickerView: View {
    
    @StateObject var exploreVM: ExploreViewModel
    
    var body: some View {
        Picker(selection: $exploreVM.selectedMediaType, label: Text("Selecione um tipo de mídia")) {
            Text("Séries").tag(MediaType.series)
            Text("Filmes").tag(MediaType.movies)
        }
        .pickerStyle(SegmentedPickerStyle())
    }
}



// MARK: - PREVIEW
struct ExploreView_Previews: PreviewProvider {
    
    static var previews: some View {
        let exploreVM = ExploreViewModel()
        return ExploreView(exploreVM: exploreVM)
    }
}
