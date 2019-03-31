//
//  Movie+CoreDataProperties.swift
//  ZuriHomeTask
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
