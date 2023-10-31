//
//  ContentView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 03/01/23.
//

import SwiftUI

struct PersonalListView: View {
    
    @StateObject var exploreVM: ExploreViewModel
    @State private var reloadView = false
    
    var body: some View {
        NavigationView {
            List {
                Section(header: Text("Séries"), footer: Text("Explore para adicionar séries.")) {
                    
                    ForEach(Array(exploreVM.showTitles.enumerated()), id: \.1) { index, title in
                        CustomShowRowView(title: title)
                            .swipeActions {
                                Button(role: .destructive) {
                                    // Delete the item
                                    exploreVM.showTitles.remove(at: index)
                                    print(exploreVM.showTitles)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                
                Section(header: Text("Filmes"), footer: Text("Explore para adicionar filmes.")) {
                    ForEach(Array(exploreVM.movieTitles.enumerated()), id: \.1) { index, title in
                        CustomMovieRowView(title: title)
                            .swipeActions {
                                Button(role: .destructive) {
                                    exploreVM.movieTitles.remove(at: index)
                                    print(exploreVM.movieTitles)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            .navigationTitle("Seus conteúdos")
//            .toolbar {
//                ToolbarItem(placement: .navigationBarTrailing) {
//                    NavigationLink(destination: ExploreView()) {
//                        VStack {
//                            Image(systemName: "globe")
//                            Text("Explorar")
//                                .font(.caption)
//                        }
//                    }
//
//                }
//            }
        }
    }
}

struct PersonalListView_Previews: PreviewProvider {
    static var previews: some View {
        let exploreVM = ExploreViewModel()
        
        return PersonalListView(exploreVM: exploreVM)
    }
}

// MARK: - Módulos Lista
struct CustomMovieRowView: View {
    var title: String
    var body: some View {
        HStack {
            Image(systemName: "popcorn.fill")
                .resizable()
                .frame(width: 20, height: 20)
            Text(title)
        }
    }
}

struct CustomShowRowView: View {
    var title: String
    var body: some View {
        HStack {
            Image(systemName: "play.tv.fill")
                .resizable()
                .frame(width: 20, height: 20)
            Text(title)
        }
    }
}
