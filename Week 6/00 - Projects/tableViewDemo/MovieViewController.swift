//
//  MovieViewController.swift
//  tableViewDemo
//
//  Created by Aaron Bailey on 11/15/16.
//  Copyright © 2016 Aaron Bailey. All rights reserved.
//

import UIKit
import AFNetworking

class MovieViewController: UIViewController, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var movies: [NSDictionary] = [] // setting to empty prevents return of Nil on slow call
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        
        let apiKey = "a07e22bc18f5cb106bfe4cc1f83ad8ed"
        let url = URL(string: "https://api.themoviedb.org/3/movie/now_playing?api_key=\(apiKey)")
        let request = URLRequest(url: url!, cachePolicy: .reloadIgnoringLocalCacheData, timeoutInterval: 10)
        
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: OperationQueue.main)
        let task: URLSessionDataTask = session.dataTask(with: request as URLRequest,completionHandler: { (dataOrNil, response, error) in
            
            if let data = dataOrNil {
                if let response = try! JSONSerialization.jsonObject(with: data, options:[]) as? NSDictionary {
                    
                    print("response: \(response)")
                    self.movies = response["results"] as! [NSDictionary]
                    
                    for movie in self.movies {
                        let title = movie["title"] as! String
                        print(title)
                    }
                    
                    self.tableView.reloadData()
                }
            }
        })
        
        task.resume()
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell") as! MovieTableViewCell
        
        let movie = movies[indexPath.row]
        let title = movie["title"]
        cell.titleLabel.text = title as! String?
        
        let description = movie["overview"]
        cell.overviewLabel.text = description as! String?
        
        let baseURLString = "https://image.tmdb.org/t/p/w500"
        let posterPath = movie["poster_path"] as! String
        let imageURL = URL(string: baseURLString + posterPath)
        
        cell.posterImageView.setImageWith(imageURL!)
        
        return cell
    }
}
