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
                    Text("Temporadas: \(shows.numberOfSeasons)")
                    Text(" - ")
                    Text("Episódios: \(shows.numberOfEpisodes)")
                }
                .padding()
            }
            .padding()
            
        }
    }
}

struct ShowSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShowSheetView(shows: .init(homepage: "", id: 1, name: "Wandinha", overview: "Inteligente, sarcástica e apática, Wandinha Addams pode estar meio morta por dentro, mas na Escola Nunca Mais ela vai fazer amigos, inimigos e investigar assassinatos.", posterPath: "/ooBR3qulC40ws0QkYBUAYFKmLRE.jpg", numberOfEpisodes: 10, numberOfSeasons: 1, voteAverage: 8.7))
    }
}
