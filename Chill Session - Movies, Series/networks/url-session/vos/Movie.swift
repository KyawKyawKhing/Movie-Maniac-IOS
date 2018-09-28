//
//  MovieVO.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation

struct BaseResponse : Codable {
    
    let page : Int
    let results : [Movie]
    let totalResults : Int
    let totalPages : Int
    
    enum CodingKeys : String, CodingKey {
        case page, results
        case totalResults = "total_results"
        case totalPages = "total_pages"
    }

}

struct Movie : Codable {
    
    let voteCount : Int
    
    let id : Int

    let video : Bool

    let voteAverage : Double

    let title : String

    let popularity : Double

    let posterPath : String

    let originalLanguage : String

    let originalTitle : String

//    let genre_ids : [Int]?

    let backdropPath : String?

    let adult : Bool

    let overview : String

    let releaseDate : String
    
    enum CodingKeys: String, CodingKey {
        case id,video,title,popularity, adult, overview
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
    }
    
}
