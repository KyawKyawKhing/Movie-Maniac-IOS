//
//  SharedConstants.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation

class SharedConstants {
    
    static let BASE_URL = "https://api.themoviedb.org/3/"
    static let API_KEY = "67e10f963247313db2a79cd4368c1d9f"
    static let IMAGE_BASE_PATH = "http://image.tmdb.org/t/p/w500"
    
    enum Route {
        static let NOW_PLAYING = "movie/now_playing"
        static let POPULAR = "movie/popular"
        static let UPCOMING = "movie/upcoming"
        static let TOP_RELATED = "movie/top_rated"
        static let GENRE = "genre/movie/list"
    }
    
    enum QueryString {
        static let PAGE = "page"
        static let API_TOKEN = "api_key"
    }
    
}
