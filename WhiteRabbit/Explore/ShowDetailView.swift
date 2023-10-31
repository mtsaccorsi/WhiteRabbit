//
//  SwiftUIView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 25/10/23.
//

import SwiftUI

struct ShowDetailView: View {
    
    let showDetail: ShowDetails
    
    var body: some View {
        
        VStack {
            AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(String(describing: showDetail.posterPath))")) { image in
                image
                    .resizable()
            } placeholder: {
                Color.black
            }
                .frame(width: 150, height: 225)
                .clipShape((RoundedRectangle(cornerRadius: 25)))
            VStack {
                
                Text("\(showDetail.name)")
                    .bold()
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Text("\(showDetail.voteAverage, specifier: "%.1f")")
            }
            Text("\(showDetail.overview)")
                .multilineTextAlignment(.center)
        }
        .padding()
    }
}

#Preview {
    ShowDetailView(showDetail: ShowDetails(homepage: "", id: 1, name: "Rick e Morty", overview: "Rick é um velho mentalmente desequilibrado, mas cientificamente talentoso que se reconectou recentemente com sua família. Ele passa a maior parte do tempo envolvendo o jovem neto Morty em aventuras perigosas e estranhas no espaço e em universos alternativos. Compostos à vida familiar já instável de Morty, esses eventos causam muito sofrimento a Morty em casa e na escola.", posterPath: "/oOU1aynuYPi8SnVSZeqI8t7Z2WI.jpg", numberOfEpisodes: 71, numberOfSeasons: 7, voteAverage: 8.7))
}
