//
//  ExploreListViewModel.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var showsList: [ShowsList] = []
    @Published var showDetail: [ShowDetails] = []
    
    @Published var moviesList: [MoviesList] = []
//    @Published var movieDetail: [MovieDetails] = []
    
    @Published var selectedMediaType = MediaType.series
    
    @Published var showTitles = ["Wandinha", "Noite Adentro", "The Last of Us"]
    @Published var movieTitles = ["Hellraiser", "Thor", "Matrix"]
    
    func addShowToPersonalList(title: String) {
        showTitles.append(title)
    }
    
    func addMovieToPersonalList(title: String) {
        movieTitles.append(title)
    }
    
    // MARK: - API call
    func fetchShows() {
        guard let urlAPI = URL(string: "https://api.themoviedb.org/3/discover/tv?api_key=0c9eae08decfc76faaca1c17e7d18c65&language=pt-BR&sort_by=popularity.desc&page=1") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: urlAPI)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let showsAPI = try JSONDecoder().decode(Shows.self, from: data)
                DispatchQueue.main.async {
                    self.showsList.append(contentsOf: showsAPI.results)
                    // You can update your UI or perform other tasks with the data here
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        }
        .resume()
    }
    
    func fetchShowDetails(showID: Int) {
        guard let urlAPI = URL(string: "https://api.themoviedb.org/3/tv/\(showID)?api_key=0c9eae08decfc76faaca1c17e7d18c65&language=pt-BR") else {
            print("Invalid URL")
            return
        }

        var request = URLRequest(url: urlAPI)
        request.httpMethod = "GET"
        print(request)

        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }

            guard let data = data else {
                print("No data received")
                return
            }

            do {
                let showDetailAPI = try JSONDecoder().decode(ShowDetails.self, from: data)
                DispatchQueue.main.async {
//                    self.showDetail.append(contentsOf: showDetailAPI)
                    let showDetail = ShowDetails(homepage: showDetailAPI.homepage, id: showDetailAPI.id, name: showDetailAPI.name, overview: showDetailAPI.overview, posterPath: showDetailAPI.posterPath, numberOfEpisodes: showDetailAPI.numberOfEpisodes, numberOfSeasons: showDetailAPI.numberOfSeasons, voteAverage: showDetailAPI.voteAverage)
                    print(showDetail)
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        }
        .resume()
    }
    
    func fetchMovies() {
        guard let urlAPI = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=0c9eae08decfc76faaca1c17e7d18c65&language=pt-BR&sort_by=popularity.desc&page=1") else {
            print("Invalid URL")
            return
        }
        
        let request = URLRequest(url: urlAPI)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let error = error {
                print("Error: \(error)")
                return
            }
            
            guard let data = data else {
                print("No data received")
                return
            }
            
            do {
                let moviesAPI = try JSONDecoder().decode(Movies.self, from: data)
                DispatchQueue.main.async {
                    self.moviesList.append(contentsOf: moviesAPI.results)
                    // You can update your UI or perform other tasks with the data here
                }
            } catch {
                print("JSON decoding error: \(error)")
            }
        }
        .resume()
    }

}
