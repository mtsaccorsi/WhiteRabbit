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

struct ShowsList: Codable, Identifiable {
    let id: Int
    let name: String
    let overview: String
    let poster_path: String
    let vote_average: Double
}

//MARK: - SEASONS

struct ShowDetails: Codable, Identifiable {
    let homepage: String
    let id: Int
    let name: String
    let overview: String
    let posterPath: String
    let numberOfEpisodes: Int
    let numberOfSeasons: Int
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case homepage
        case id
        case name
        case overview
        case posterPath = "poster_path"
        case numberOfEpisodes = "number_of_episodes"
        case numberOfSeasons = "number_of_seasons"
        case voteAverage = "vote_average"
    }
}

struct SeasonsInfo: Codable {
    let episodeCount: Int
    let id: Int
    let name: String
    let seasonNumber: Int
    
    enum CodingKeys: String, CodingKey {
        case episodeCount = "episode_count"
        case id
        case name
        case seasonNumber = "season_number"
    }
}

//MARK: - MOVIES
struct Movies: Codable {
    let results: [MoviesList]
}

struct MoviesList: Codable, Identifiable {
    let id: Int
    let posterPath, releaseDate, title: String
    let overview: String
    let voteAverage: Double
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case overview
        case voteAverage = "vote_average"
    }
}

struct MovieDetail: Codable {
    let backdropPath: String
    let id: Int
    let overview: String
    let posterPath: String
    let releaseDate: String
    let runtime: Int
    let title: String
    let voteAverage: Double

    enum CodingKeys: String, CodingKey {
        case backdropPath = "backdrop_path"
        case id
        case overview
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case runtime
        case title
        case voteAverage = "vote_average"
    }
}

enum MediaType: Int {
    case series
    case movies
}

//MARK: - Error
enum FetchError: Error {
    case invalidURL
    case networkError(Error)
    case jsonDecodingError(Error)
}
