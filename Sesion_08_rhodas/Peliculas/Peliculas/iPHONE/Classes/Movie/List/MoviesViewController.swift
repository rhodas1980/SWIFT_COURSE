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
        //Este metodo devuelve un UITableViewCell
        //aplicamos un as? para que pueda leer otra clase
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieTableViewCell", for: indexPath) as? MovieTableViewCell
        let movie = self.arrayMovies[indexPath.row]
        cell?.updateData(movie)
        
        //obtenemos el indice del array
            //let movie = self.arrayMovies[indexPath.row]
        //de acuerdo al indice obtenemo el title
        //y lo seteamos al textLabel del cell
            //cell.textLabel?.text = movie.title
        
        return cell ?? MovieTableViewCell()
    }
}
