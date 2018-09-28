//
//  DataModel.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation

class DataModel {
    
    private init() {}
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    class func shared() -> DataModel {
        return sharedDataModel
    }
    
    func loadNowPlayingMovies(completion : @escaping ([Movie]) -> Void) {
        
        let networkManager = NetworkManager()
        networkManager.getNowPlayingMovie { (movieList) in
            DispatchQueue.main.async {
                completion(movieList)
            }
        }
    }
    
}
