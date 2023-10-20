//
//  ExploreDetailView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 06/01/23.
//

import SwiftUI

struct ShowView: View {
    
    let shows: ShowsList
    
    var body: some View {

            VStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(String(describing: shows.poster_path))")) { image in
                    image
                        .resizable()
                } placeholder: {
                    Color.black
                }
                    .frame(width: 150, height: 225)
                    .clipShape((RoundedRectangle(cornerRadius: 25)))
                Spacer()
                VStack {
                    Text("\(shows.name)")
                        .bold()
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .truncationMode(.tail)
                    Text("\(shows.vote_average, specifier: "%.1f")")
                }
            }

    }
}

struct ExploreDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(shows: .init(id: 1, name: "Wandinha", overview: "Inteligente, sarcástica e apática, Wandinha Addams pode estar meio morta por dentro, mas na Escola Nunca Mais ela vai fazer amigos, inimigos e investigar assassinatos.", poster_path: "/ooBR3qulC40ws0QkYBUAYFKmLRE.jpg", vote_average: 8.7))
    }
}
