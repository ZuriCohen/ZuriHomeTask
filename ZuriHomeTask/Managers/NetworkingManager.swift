//
//  NetworkingService.swift
//  ZuriHomeTask
//
//  Created by inmanage on 25/03/2019.
//  Copyright © 2019 inmanage. All rights reserved.
//

import Foundation


struct JsonData: Decodable {
    var itemsArr: [Item]
    
    init() {
        itemsArr = [Item]()
    }
}

class NetworkingManager {
    
    static let sheredInstance = NetworkingManager()
    var itemsArr = [Item]()
    
    func testFunc(completion: () -> ()){
        
        completion()
    }
    
    func downloadJson(complition: @escaping () -> ()) {
        
        let jsonUrlString = "https://api.androidhive.info/json/movies.json"
        
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) {
            (data, response, err) in
            
            guard let data = data else { return }
            
            do {
                var jsonData = JsonData()
                jsonData.itemsArr = try JSONDecoder().decode([Item].self, from: data)
                self.itemsArr = jsonData.itemsArr
        
                complition()
                
            } catch let jsonErr {
                print("Error serializing json: \(jsonErr)")
            }
            
            }.resume()
    }
}
