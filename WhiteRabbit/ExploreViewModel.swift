//
//  ExploreListViewModel.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import Foundation

class ExploreViewModel: ObservableObject {
    
    @Published var showsList: [ShowsList] = []
    @Published var showDetail: [Details] = []
    
    func fetchShows() {
        if let urlAPI = URL(string: "https://api.themoviedb.org/3/discover/tv?api_key=5ef5b92a35a7b5ea80381518dfc23a00&language=pt-BR&sort_by=popularity.desc&page=1") {
            
            var request = URLRequest(url: urlAPI)
            request.httpMethod = "GET"
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    if let showsAPI = try? JSONDecoder().decode(Shows.self, from: data!) {
                        DispatchQueue.main.async {
                            self.showsList.append(contentsOf: showsAPI.results)
                            print(showsAPI)
                        }
                    }
                }
            }
            .resume()
        }
    }
    
    func showDetails(showID: Int) {
        if let urlAPI = URL(string: "https://api.themoviedb.org/3/tv/\(showID)?api_key=5ef5b92a35a7b5ea80381518dfc23a00&language=pt-BR") {
            
            var request = URLRequest(url: urlAPI)
            request.httpMethod = "GET"
            print(request)
            
            URLSession.shared.dataTask(with: request) { (data, response, error) in
                
                if error != nil {
                    print("There was an error")
                } else if data != nil {
                    if let showDetailAPI = try? JSONDecoder().decode(ShowDetails.self, from: data!) {
                        DispatchQueue.main.async {
                            self.showDetail.append(contentsOf: showDetailAPI.results)
                            print(showDetailAPI)
                        }
                    }
                }
            }
            .resume()
        }
    }
}
