//
//  ViewController.swift
//  Youtube-app
//
//  Created by Laila Guzzon Hussein Lailota on 06/07/21.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
    }

}

