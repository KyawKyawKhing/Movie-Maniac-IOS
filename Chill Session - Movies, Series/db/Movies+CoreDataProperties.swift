//
//  Movies+CoreDataProperties.swift
//  Chill Session - Movies, Series
//
//  Created by Win Than Htike on 9/29/18.
//  Copyright © 2018 PADC. All rights reserved.
//
//

import Foundation
import CoreData


extension Movies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movies> {
        return NSFetchRequest<Movies>(entityName: "Movies")
    }

    @NSManaged public var vote_count: Int32
    @NSManaged public var id: Int64
    @NSManaged public var video: Bool
    @NSManaged public var vote_average: Double
    @NSManaged public var title: String?
    @NSManaged public var popularity: Double
    @NSManaged public var poster_path: String?
    @NSManaged public var original_language: String?
    @NSManaged public var original_title: String?
    @NSManaged public var genre_ids: String?
    @NSManaged public var backdrop_path: String?
    @NSManaged public var adult: Bool
    @NSManaged public var overview: String?
    @NSManaged public var release_date: String?

}
