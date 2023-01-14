//
//  ShowView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 07/01/23.
//

import SwiftUI

struct ShowSheetView: View {
    
    let shows: ShowsList
    
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
                }
                .padding()
            
        }
    }
}

struct ShowSheetView_Previews: PreviewProvider {
    static var previews: some View {
        ShowSheetView(shows: .init(id: 1, name: "Wandinha", overview: "Inteligente, sarcástica e apática, Wandinha Addams pode estar meio morta por dentro, mas na Escola Nunca Mais ela vai fazer amigos, inimigos e investigar assassinatos.", poster_path: "/ooBR3qulC40ws0QkYBUAYFKmLRE.jpg", vote_average: 8.7))
    }
}
