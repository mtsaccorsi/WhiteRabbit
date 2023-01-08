//
//  ShowView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 07/01/23.
//

import SwiftUI

struct ShowView: View {
    
    let showsInfo: Details
    
    var body: some View {
        ZStack {
            
            VStack {
                Text("\(showsInfo.name)")
                    .bold()
                    .padding()
                Text("\(showsInfo.overview)")
                Grid {
                    GridRow {
                        Text("Qtd. episódios: \(showsInfo.number_of_episodes)")
                        Text("Qtd. temporadas: \(showsInfo.number_of_seasons)")
                    }
                }
                .padding()
            }
        }
    }
}

struct ShowView_Previews: PreviewProvider {
    static var previews: some View {
        ShowView(showsInfo: .init(homepage: "https://www.netflix.com/title/81231974", id: 119051, name: "Wandinha", overview: "Inteligente, sarcástica e apática, Wandinha Addams pode estar meio morta por dentro, mas na Escola Nunca Mais ela vai fazer amigos, inimigos e investigar assassinatos.", number_of_episodes: 8, number_of_seasons: 2))
    }
}
