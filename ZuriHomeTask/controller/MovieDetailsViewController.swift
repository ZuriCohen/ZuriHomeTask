//
//  MovieDetailsViewController.swift
//  ZuriHomeTask
//


import UIKit

class MovieDetailsViewController: UIViewController {
    
    @IBOutlet weak var lblMovieTitle: UILabel!
    @IBOutlet weak var imgMain: UIImageView!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblReleaseYear: UILabel!
    
    var selectedMovie: Movie?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupUI()
    }
    
    func setupUI() {
        
        guard let selectedMovieAnwraped = selectedMovie else {return}
        
        self.lblMovieTitle.text = selectedMovieAnwraped.title
        self.lblRating.text = "Rating: " + String(selectedMovieAnwraped.rating)
        self.lblReleaseYear.text = "Release Year :" + String(selectedMovieAnwraped.releaseYear)

        if let imageURL = URL(string: selectedMovieAnwraped.image) {
            let image = self.imgMain
            image?.sd_setImage(with: imageURL)
        }
    }
}
