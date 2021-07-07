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

    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard myTableView.indexPathForSelectedRow != nil else {
            return
        }
        
        let selectedVideo = videos[myTableView.indexPathForSelectedRow!.row]
        
        let detailVC = segue.destination as? DetailViewController
        detailVC?.video = selectedVideo
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
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell", for: indexPath) as? VideoTableViewCell
        
        let video = self.videos[indexPath.row]
        cell?.setCell(video)
        
        return cell ?? UITableViewCell()
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //
    }
}
