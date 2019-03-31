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
        
        ////
        
        NetworkingManager.sheredInstance.downloadJson {
            
            self.itemsArr = NetworkingManager.sheredInstance.itemsArr
            self.createMovieForCoreData()
        }
        
        ////
     
    }
  
    func createMovieForCoreData(moviesArr: [Movie]) {
        
        let movieFromCoreData = Movie(context: PersistenceManager.context)
        
        for movie in moviesArr {
            movieFromCoreData.title = movie.title
            // image
            movieFromCoreData.rating = movie.rating
            movieFromCoreData.releaseYear = movie.releaseYear
            movieFromCoreData.genre = movie.genre
            PersistenceManager.saveContext()
        }
        
        
        movieFromCoreData.title = "title in core data"
        movieFromCoreData.rating =   4.3 //self.itemsArr[0].rating
        movieFromCoreData.releaseYear = 1978
        movieFromCoreData.genre = ["23" , "45"]
        
        PersistenceManager.saveContext()
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

