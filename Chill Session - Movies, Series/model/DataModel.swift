//
//  DataModel.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import CoreData

class DataModel {
    
    private init() {}
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    class func shared() -> DataModel {
        return sharedDataModel
    }
    
    func getNowPlayingMovies(context : NSManagedObjectContext, completion : @escaping ([Movies]) -> Void) {
        
        let networkManager = NetworkManager()
        networkManager.loadNowPlayingMovie { (movieList) in
            
            Movie.deleteMovieList(context: context)
            Movie.save(movieList: movieList, context: context)
            
            DispatchQueue.main.async {
                completion(Movie.getMovieList(context: context))
            }
        }
    }
    
}
