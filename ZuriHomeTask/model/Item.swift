//
//  Item.swift
//  ZuriHomeTask
//
//  Created by inmanage on 25/03/2019.
//  Copyright © 2019 inmanage. All rights reserved.
//

import Foundation

class Item: Decodable {
    
    let title: String
    let image: String
    let rating: Double
    let releaseYear: Int
    let genre: [String]
    
    init(title: String, image: String, rating: Double, releaseYear: Int, genre: [String]) {
        
        self.title = title
        self.image = image
        self.rating = rating
        self.releaseYear = releaseYear
        self.genre = genre
     
    }
    
}


