//
//  MovieDetailsViewController.swift
//  ZuriHomeTask
//
//  Created by inmanage on 25/03/2019.
//  Copyright © 2019 inmanage. All rights reserved.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblReleaseYear: UILabel!
    
    var selectedMovie: Item?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI() {
        
        guard let selectedMovieAnwraped = selectedMovie else {return} // return buck
        
        self.lblMovieTitle.text = selectedMovieAnwraped.title
        self.lblRating.text = "Rating: " + String(selectedMovieAnwraped.rating)
        self.lblReleaseYear.text = "Release Year :" + String(selectedMovieAnwraped.releaseYear)
        
        if let imageURL = URL(string: (selectedMovieAnwraped.image)) {
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        
                        self.imgMain.image = image
                    }
                }
            }
        }
        
        
    }
    

}
