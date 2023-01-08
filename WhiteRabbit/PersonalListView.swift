//
//  ContentView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 03/01/23.
//

import SwiftUI

struct PersonalListView: View {
    
    var showTitles = ["Wandinha", "Noite Adentro", "The Last of Us"]
    var movieTitles = ["Avatar", "Adão Negro", "A Escola do Bem e do Mal"]
    
    var body: some View {
        NavigationStack {
            List {
                Section(header: Text("Séries"), footer: Text("Explore para adicionar séries.")) {
                    ForEach(showTitles, id: \.self) { title in
                        CustomShowRowView(title: title)
                            .swipeActions {
                                Button(role: .destructive) {
                                    print("Delete")
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
                
                Section(header: Text("Filmes"), footer: Text("Explore para adicionar filmes.")) {
                    ForEach(movieTitles, id: \.self) { title in
                        CustomMovieRowView(title: title)
                            .swipeActions {
                                Button(role: .destructive) {
                                    print("Delete")
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                            }
                    }
                }
            }
            .navigationTitle("Seus conteúdos")
        }
        
    }
}

struct PersonalListView_Previews: PreviewProvider {
    static var previews: some View {
        PersonalListView()
    }
}

struct CustomMovieRowView: View {
    var title: String
    var body: some View {
        HStack {
            Image(systemName: "popcorn.fill")
                .frame(width: 40, height: 40)
            Text(title)
        }
    }
}

struct CustomShowRowView: View {
    var title: String
    var body: some View {
        HStack {
            Image(systemName: "tv.inset.filled")
                .frame(width: 40, height: 40)
            Text(title)
        }
    }
}
