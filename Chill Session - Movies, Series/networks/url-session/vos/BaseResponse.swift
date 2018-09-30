//
//  BaseResponse.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/30/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation

class BaseResponse : Codable {
    
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
