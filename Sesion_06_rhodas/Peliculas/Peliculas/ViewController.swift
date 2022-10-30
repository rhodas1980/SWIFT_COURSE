//
//  ViewController.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let ws = MovieWS()
        ws.getAllMovies()
        
        //if you have problems with errors while compiling just right click on
        //Package dependencies and then click on Reset Packages Caches
    }


}

