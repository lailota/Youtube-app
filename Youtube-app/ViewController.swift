//
//  ViewController.swift
//  Youtube-app
//
//  Created by Laila Guzzon Hussein Lailota on 06/07/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myTableView: UITableView!
    
    var model = Model()
    var videos = [Video]()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        myTableView.dataSource = self
        myTableView.delegate = self
        
        model.delegate = self
        model.getVideos()
    }

}

// MARK: - Model Delegate Methods

extension ViewController: ModelDelegate {
    
    func videosFetched(_ videos: [Video]) {
        
        self.videos = videos
        myTableView.reloadData()
    }
    
}


// MARK: - TableView Methods

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return videos.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath)
        
        let title = self.videos[indexPath.row].title
        cell.textLabel?.text = title
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
