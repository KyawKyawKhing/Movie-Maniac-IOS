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
    let networkManager:NetworkManager
    private init() { networkManager = NetworkManager()}
    
    private static var sharedDataModel: DataModel = {
        let dataModel = DataModel()
        return dataModel
    }()
    
    class func shared() -> DataModel {
        return sharedDataModel
    }
    
    //like singleton
    
    func getMovies(context : NSManagedObjectContext,
                             route: String,
                             success: @escaping ([Movies]) -> Void,
                             failure: @escaping (Error) -> Void) {
        
        
        networkManager.loadData(route: route,success: { (data) in
            var movieList:[Movie] = []
            do {
                let movie = try JSONDecoder().decode(BaseResponse.self, from: data as! Data)
                movieList = movie.results
            } catch let jsonErr {
                print("JSONSerialization error ==> \(jsonErr.localizedDescription)")
            }
            
            Movie.deleteMovieList(context: context)
            Movie.save(movieList: movieList , context: context)
            
            DispatchQueue.main.async {
                success(Movie.getMovieList(context: context))
            }
            
        }) { (error) in
            DispatchQueue.main.async {
                failure(error)
            }
        }
        
    }
    
    func getGenreList(context:NSManagedObjectContext,route:String,genreIds:[String],success: @escaping ([String]) -> Void, failure: @escaping (Error) -> Void){
        networkManager.loadData(route: route, success: { (data) in
            var genreList:[Genre] = []
            do {
                let genre = try JSONDecoder().decode(GenreResponse.self, from: data as! Data)
                genreList = genre.genres
            } catch let jsonErr {
                print("JSONSerialization error ==> \(jsonErr.localizedDescription)")
            }
            var genreNames:[String] = []
            for genre in genreList{
                if genreIds.contains("\(genre.id)"){
                    genreNames.append(genre.name)
                }
            }
            DispatchQueue.main.async {
                success(genreNames)
            }
        }, failure: {(error) in
            DispatchQueue.main.async {
                failure(error)
            }
        })
    }
    
    func getReviewList(context:NSManagedObjectContext,movieId:String,success: @escaping ([Review]) -> Void, failure: @escaping (Error) -> Void){
       let route = "movie/\(movieId)/reviews"
        networkManager.loadData(route: route, success: { (data) in
            var reviewList:[Review] = []
            do {
                let review = try JSONDecoder().decode(ReviewResponse.self, from: data as! Data)
                reviewList = review.reviews
            } catch let jsonErr {
                print("JSONSerialization error ==> \(jsonErr.localizedDescription)")
            }
            DispatchQueue.main.async {
                success(reviewList)
            }
        }, failure: {(error) in
            DispatchQueue.main.async {
                failure(error)
            }
        })
    }
        
}
