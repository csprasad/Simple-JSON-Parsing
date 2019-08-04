//
//  ViewController.swift
//  JsonParsing
//
//  Created by Rakeshkumar Desai on 11/07/19.
//  Copyright © 2019 Rakeshkumar Desai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    let model = Networking()
    var MovieArray = [results]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
//        model.API()
//        model.ApiCalling(url: "https://jsonplaceholder.typicode.com/posts") { (apiData) in
//            print("POSTS : -> \(apiData)")
//        }
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
//        model.API()
        
        model.ApiCalling(url: "https://api.myjson.com/bins/10jzk3") { (api) in
            print("Albums : -> \(api)")
            for i in api {
                for j in i.results {
                    self.MovieArray.append(j)
                }
            }
            print(self.MovieArray)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
            
        }
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MovieArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        let Datajson = MovieArray[indexPath.row]
        cell.MovieTitle.text = Datajson.artistName
        cell.Releasedyear.text = String(Datajson.collectionPrice)
        cell.cast.text = Datajson.country
        cell.genres.text = Datajson.trackName
        if let imgUrl = URL(string: Datajson.artworkUrl100){
            do {
                let img = try Data(contentsOf: imgUrl)
                cell.Img.image = UIImage(data: img)
            } catch {
                print(error)
            }
        }
        
//        cell.Img.image = UIImage(url: imgUrl)
        return cell
    }
}


extension UIImage {
    convenience init?(url: URL?) {
        guard let url = url else { return nil }
        
        do {
            let data = try Data(contentsOf: url)
            self.init(data: data)
        } catch {
            print("Cannot load image from url: \(url) with error: \(error)")
            return nil
        }
    }
}
