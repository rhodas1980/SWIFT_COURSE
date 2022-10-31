//
//  MoviesViewController.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import UIKit

class MoviesViewController: UIViewController {
    
    @IBOutlet private weak var tlvMovies: UITableView!
    
    var arrayMovies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //se le especifica al TableView que su
        //datasource va a ser controlada por el
        //MoviesViewcontroller
        self.tlvMovies.dataSource = self
        
        let ws = MovieWS()
        ws.getAllMovies { arrayMoviesDTO in
            self.arrayMovies = arrayMoviesDTO.toMovies
            //recarga el tableview
            self.tlvMovies.reloadData()
            
            
            //forma novata
//            var arrayMovies = [Movie]()
//
//            for dto in arrayMoviesDTO {
//                arrayMovies.append(Movie(dto: dto))
//            }
//            self.arrayMovies = arrayMovies
        }
    }
}

//estos metodos funcionaran con el TableView : tlvMovies
extension MoviesViewController: UITableViewDataSource {
    
    //que tenga 20 filas
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 20
        return self.arrayMovies.count
    }
    
    //que pinte una fila , que construya una celda que tenga como
    //prototipo el identificador pepito
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "pepito", for: indexPath)
        
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        
        //asigna colores random a las celdas
        cell.backgroundColor = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        
        //obtenemos el indice del array
        let movie = self.arrayMovies[indexPath.row]
        //de acuerdo al indice obtenemo el title
        //y lo seteamos al textLabel del cell
        cell.textLabel?.text = movie.title
        
        return cell
    }
}
