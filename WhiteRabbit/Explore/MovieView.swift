//
//  MovieView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 19/10/23.
//

import SwiftUI

struct MovieView: View {
    
    let movies: MoviesList
    
    var body: some View {

            VStack {
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(String(describing: movies.posterPath))")) { image in
                    image
                        .resizable()
                } placeholder: {
                    Color.black
                }
                    .frame(width: 150, height: 225)
                    .clipShape((RoundedRectangle(cornerRadius: 25)))
                Spacer()
                VStack {
                    Text("\(movies.title)")
                        .bold()
                        .font(.subheadline)
                        .multilineTextAlignment(.center)
                        .lineLimit(2)
                        .truncationMode(.tail)
                    Text("\(movies.voteAverage, specifier: "%.1f")")
                }
            }

    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(movies: .init(id: 1, posterPath: "/8hjno4uE19pm0qlfUDcM8e5WK13.jpg", releaseDate: "2023-07-08", title: "Missão: Impossível - Acerto de Contas Parte 1", overview: "Ethan Hunt e sua equipe embarcam em sua missão mais perigosa: rastrear uma nova arma aterrorizante que ameaça toda a humanidade antes que caia em mãos erradas. Com o controle do futuro e o destino do mundo em jogo e as forças sombrias do passado de Ethan se aproximando, uma corrida mortal ao redor do globo começa. Confrontado por um inimigo misterioso e todo-poderoso, Ethan é forçado a considerar que nada pode importar mais do que sua missão – nem mesmo a vida daqueles com quem ele mais se importa.", voteAverage: 7.7))
    }
}

