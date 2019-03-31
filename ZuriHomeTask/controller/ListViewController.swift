//
//  ListViewControllerViewController.swift
//  ZuriHomeTask
//


import UIKit
import CoreData

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var movieArr = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.setupUI()
        self.registerNibs()
        self.fetchDataFromCoreData()
        
    }
    
    func setupUI() {
        
    }
    
    func registerNibs() {
        self.tableView.register(UINib(nibName: MovieTableViewCell.className, bundle: nil), forCellReuseIdentifier: MovieTableViewCell.className)
    }
    
    func fetchDataFromCoreData() {
        
        let  fetchRequest: NSFetchRequest<Movie> = Movie.fetchRequest()
        
        do {
            let moviesArr = try PersistenceManager.context.fetch(fetchRequest)
             self.movieArr = moviesArr
             self.tableView.reloadData()
        } catch {
            // Error handeling
            print("Error fetch data from core data ")
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.className, for: indexPath) as! MovieTableViewCell
        
        cell.lblTitle.text = self.movieArr[indexPath.row].title
        
        let url = URL(string: movieArr[indexPath.row].image)
        
//        DispatchQueue.global().async {
//            let data = try? Data(contentsOf: url!) //make sure your image in this url does exist, otherwise unwrap in a if let check / try-catch
//            DispatchQueue.main.async {
//                cell.imgMain.image = UIImage(data: data!)
//            }
//        }
        
        if let imageURL = URL(string: movieArr[indexPath.row].image) { // TODO: swift sdwebimage
            DispatchQueue.global().async {
                let data = try? Data(contentsOf: imageURL)
                if let data = data {
                    let image = UIImage(data: data)
                    DispatchQueue.main.async {
                        cell.imgMain.image = image
                    }
                }
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let destinationVC = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: MovieDetailsViewController.className) as? MovieDetailsViewController {
            
            destinationVC.selectedMovie = self.movieArr[indexPath.row]
            self.navigationController?.pushViewController(destinationVC, animated: true)
            
        }
    }
}
