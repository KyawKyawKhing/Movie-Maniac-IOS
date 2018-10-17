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
    
    func getNowPlayingMovies(context : NSManagedObjectContext,
                             success: @escaping ([Movies]) -> Void,
                             failure: @escaping (Error) -> Void) {
        
        let networkManager = NetworkManager()
        networkManager.loadNowPlayingMovie(success: { (movieList) in
            
            Movie.deleteMovieList(context: context)
            Movie.save(movieList: movieList, context: context)
            
            DispatchQueue.main.async {
                success(Movie.getMovieList(context: context))
            }
            
        }) { (error) in
            DispatchQueue.main.async {
                failure(error)
            }
        }
        
    }
    
}
