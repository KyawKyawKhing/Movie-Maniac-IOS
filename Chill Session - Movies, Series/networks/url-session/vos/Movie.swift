//
//  MovieVO.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/28/18.
//  Copyright © 2018 PADC. All rights reserved.
//

import Foundation
import CoreData

struct Movie : Codable {
    
    let voteCount : Int32?
    
    let id : Int64?

    let video : Bool?

    let voteAverage : Double?

    let title : String?

    let popularity : Double?

    let posterPath : String?

    let originalLanguage : String?

    let originalTitle : String?

    let genreIds : [Int]?

    let backdropPath : String?

    let adult : Bool?

    let overview : String?

    let releaseDate : String?
    
    enum CodingKeys: String, CodingKey {
        case id,video,title,popularity, adult, overview
        case voteCount = "vote_count"
        case voteAverage = "vote_average"
        case posterPath = "poster_path"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case backdropPath = "backdrop_path"
        case releaseDate = "release_date"
        case genreIds = "genre_ids"
    }
    
    
    public static func save(movieList : [Movie], context : NSManagedObjectContext) {
        
        movieList.forEach { (movie) in
            let data = Movies(entity: Movies.entity(), insertInto: context)
            data.vote_count = movie.voteCount!
            data.id = movie.id!
            data.video = movie.video!
            data.vote_average = movie.voteAverage!
            data.title = movie.title
            data.popularity = movie.popularity!
            data.poster_path = movie.posterPath
            data.original_language = movie.originalLanguage
            data.original_title = movie.originalTitle
            data.genre_ids = movie.genreIds?.description
            data.backdrop_path = movie.backdropPath
            data.adult = movie.adult!
            data.overview = movie.overview
            data.release_date = movie.releaseDate
            saveContext(context: context)
        }
        
    }
    
    static func saveContext (context : NSManagedObjectContext) {
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
    }
    
    public static func getMovieList(context : NSManagedObjectContext) -> [Movies] {
        var movieList = [Movies]()
        do {
            movieList = try context.fetch(Movies.fetchRequest())
        } catch let error as NSError {
            print("Could not fetch. \(error), \(error.userInfo)")
        }
        return movieList
    }
    
    public static func deleteMovieList(context : NSManagedObjectContext) {
        let deleteFetch = NSFetchRequest<NSFetchRequestResult>(entityName: "Movies")
        let deleteRequest = NSBatchDeleteRequest(fetchRequest: deleteFetch)
        do {
            try context.execute(deleteRequest)
            try context.save()
        } catch {
            print ("There was an error")
        }
        
    }
    //savecontext in model => can't call AppDelegate
}
