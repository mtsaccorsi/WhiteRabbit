//
//  MovieDetailView.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 31/10/23.
//

import SwiftUI

struct MovieDetailView: View {
    
    @StateObject var exploreVM: ExploreViewModel

    let movieDetail: MovieDetail
    
    var body: some View {
        VStack {
            
            ZStack {
                
                Image(systemName: exploreVM.movieTitles.contains(movieDetail.title) ? "minus.circle.fill" : "plus.circle.fill")
                    .resizable()
                    .frame(width: 50, height: 50)
                    .foregroundColor(exploreVM.movieTitles.contains(movieDetail.title) ? .red : .green)
                    .offset(x: 75, y: 110)
                    .zIndex(1)
                    .onTapGesture {
                        if exploreVM.movieTitles.contains(movieDetail.title) {
                            exploreVM.movieTitles.removeAll { $0 == movieDetail.title }
                        } else {
                            exploreVM.addMovieToPersonalList(title: movieDetail.title)
                            print(exploreVM.movieTitles)
                        }
                    }
                
                AsyncImage(url: URL(string: "https://image.tmdb.org/t/p/w600_and_h900_bestv2/\(String(describing: movieDetail.posterPath))")) { image in
                    image
                        .resizable()
                } placeholder: {
                    Color.black
                }
                .frame(width: 150, height: 225)
                .clipShape((RoundedRectangle(cornerRadius: 25)))
            }
            .padding(.bottom, 30)
            
            VStack {
                
                Text("\(movieDetail.title)")
                    .bold()
                    .font(.subheadline)
                    .multilineTextAlignment(.center)
                    .lineLimit(2)
                    .truncationMode(.tail)
                Text("\(movieDetail.voteAverage, specifier: "%.1f")")
            }
            Text("\(movieDetail.overview)")
                .multilineTextAlignment(.leading)
        }
        .padding()
    }
}


#Preview {
    MovieDetailView(exploreVM: ExploreViewModel(), movieDetail: .init(backdropPath: "/t5zCBSB5xMDKcDqe91qahCOUYVV.jpg", id: 507089, overview: "Enquanto passa sua primeira noite no trabalho, um problemático guarda de segurança da Pizzaria Freddy Fazbear logo percebe que não será uma tarefa fácil sobreviver ao seu primeiro turno.", posterPath: "/1yUbmAiw2cUSpyXNIaiST7JzCtG.jpg", releaseDate: "2023-10-25", runtime: 110, title: "Five Nights at Freddy's - O Pesadelo Sem Fim", voteAverage: 8.4))
}
