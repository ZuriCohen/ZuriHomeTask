//
//  ListViewControllerViewController.swift
//  ZuriHomeTask
//
//  Created by inmanage on 26/03/2019.
//  Copyright © 2019 inmanage. All rights reserved.
//

import UIKit
import CoreData

class ListViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var itemsArr = [Item]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        self.registerNibs()
        
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
             self.itemsArr = moviesArr // get all the array items(movie type) into my items array
             self.tableView.reloadData()
        } catch {
            // Error handeling
            print("Error fetch data from core data ")
        }
    }
}

extension ListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.itemsArr.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: MovieTableViewCell.className, for: indexPath) as! MovieTableViewCell
        
        cell.lblTitle.text = self.itemsArr[indexPath.row].title
        
        if let imageURL = URL(string: itemsArr[indexPath.row].image) { // TODO: swift sdwebimage
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
            
            destinationVC.selectedMovie = self.itemsArr[indexPath.row]
            self.navigationController?.pushViewController(destinationVC, animated: true)
            
        }
    }
    
//    //
//    override func didMove(toParent parent: UIViewController?) {
//        super.didMove(toParent: parent)
//
//        if parent == nil {
//            debugPrint("Back Button pressed.")
//        }
//    }
//    //
}
