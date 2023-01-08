//
//  ExploreModel.swift
//  WhiteRabbit
//
//  Created by Matheus Accorsi on 05/01/23.
//

import Foundation

//MARK: - SHOWS
struct Shows: Codable {
    let results: [ShowsList]
}

struct ShowsList: Codable {
    let id: Int
    let name: String
    let overview: String?
    let poster_path: String
    let vote_average: Double
}

//MARK: - SEASONS
struct ShowDetails: Codable {
    let results: [Details]
}

struct Details: Codable {
    let homepage: String
    let id: Int
    let name: String
    let overview: String
    let number_of_episodes: Int
    let number_of_seasons: Int
}

struct SeasonsInfo: Codable {
    let episode_count: Int
    let id: Int
    let name: String
    let season_number: Int
}
