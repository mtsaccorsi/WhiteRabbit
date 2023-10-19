//
//  ShowView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 07/01/23.
//

import SwiftUI

struct ShowSheetView: View {
    
    let shows: ShowDetails
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(shows.name)")
                    .bold()
                    .font(.largeTitle)
                    .padding()
                Text("\(shows.overview)")
                    .font(.subheadline)
                    .multilineTextAlignment(.leading)
                HStack {
                    Text("Temporadas: \(shows.number_of_seasons)")
                    Text(" - ")
                    Text("Episódios: \(shows.number_of_episodes)")
                }
                .padding()
            }
            .padding()
            
        }
    }
}

struct ShowSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShowSheetView(shows: .init(homepage: "", id: 1, name: "Wandinha", overview: "Inteligente, sarcástica e apática, Wandinha Addams pode estar meio morta por dentro, mas na Escola Nunca Mais ela vai fazer amigos, inimigos e investigar assassinatos.", poster_path: "/ooBR3qulC40ws0QkYBUAYFKmLRE.jpg", number_of_episodes: 10, number_of_seasons: 1, vote_average: 8.7))
    }
}
