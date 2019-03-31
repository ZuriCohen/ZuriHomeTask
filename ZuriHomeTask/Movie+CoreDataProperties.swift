//
//  Movie+CoreDataProperties.swift
//  ZuriHomeTask
//
//  Created by inmanage on 27/03/2019.
//  Copyright © 2019 inmanage. All rights reserved.
//
//

import Foundation
import CoreData


extension Movie {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Movie> {
        return NSFetchRequest<Movie>(entityName: "Movie")
    }

    @NSManaged public var title: String?
    @NSManaged public var image: String
    @NSManaged public var rating: Double
    @NSManaged public var releaseYear: Int16
    @NSManaged var genre: [String]

}
