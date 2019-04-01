//
//  SplashViewController.swift
//  ZuriHomeTask
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

