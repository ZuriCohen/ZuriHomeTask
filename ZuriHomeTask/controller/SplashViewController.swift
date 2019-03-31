//
//  SplashViewController.swift
//  ZuriHomeTask
//
//  Created by inmanage on 25/03/2019.
//  Copyright © 2019 inmanage. All rights reserved.
//

import UIKit
import CoreData

class SplashViewController: UIViewController {
    
    var itemsArr = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkingManager.sheredInstance.downloadJson {
            
            self.itemsArr = NetworkingManager.sheredInstance.itemsArr 
            self.createMovieForCoreData(moviesArr: self.itemsArr)
        }
        
    }
    
    func createMovieForCoreData(moviesArr: [Item]) {
        
        //let movieFromCoreData = Movie(context: PersistenceManager.context)
        
        for movie in moviesArr {
            let movieFromCoreData = Movie(context: PersistenceManager.context)
            movieFromCoreData.title = movie.title
            movieFromCoreData.image = movie.image
            movieFromCoreData.rating = movie.rating
            movieFromCoreData.releaseYear = Int16(movie.releaseYear)
            movieFromCoreData.genre = movie.genre
            PersistenceManager.saveContext()
        }
        
    }
    
    
    @IBAction func didTapNext(_ sender: Any) {
        
        self.presentNextViewController()
    }
    
    func presentNextViewController() {
        
        if let destinationVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: ListViewController.className) as? ListViewController {
            
            self.navigationController?.pushViewController(destinationVC, animated: true)
        }
    }
}

