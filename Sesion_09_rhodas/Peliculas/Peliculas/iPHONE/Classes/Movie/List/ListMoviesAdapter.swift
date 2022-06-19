//
//  ListMoviesAdapter.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 19/06/22.
//

import UIKit

class ListMoviesAdapter: NSObject {
    
    private unowned let controller: MoviesViewProtocol
    var arrayData = [Any]()
    
    init(controller: MoviesViewProtocol) {
        self.controller = controller
    }
}

//esto es una Interfaz
//estos metodos funcionaran con el TableView : tlvMovies
extension ListMoviesAdapter: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 20
        return self.arrayData.count
    }
    
    //que pinte una fila , que construya una celda que tenga como
    //prototipo el identificador "MovieTableViewCell"
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let element  = self.arrayData[indexPath.row]
        //si el elemento de la iteracion es un Movie
        //entonces me retornara un Movie
        if let movie = element as? Movie {
            //Este metodo devuelve un UITableViewCell
            return MovieTableViewCell.createIn(tableView, indexPath: indexPath, movie: movie)
        } else if let errorMessage = element as? String {
            //de lo contrario
            return ErrorTableViewCell.createIn(tableView, indexPath: indexPath, errorMessage: errorMessage)
        } else {
            return UITableViewCell()
        }
        
        
    }
}


//este metodo se llama cada vez que se  selecciona
// una celda de la tabla
extension ListMoviesAdapter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let movie = self.arrayData[indexPath.row] as? Movie {
            self.controller.didSelectMovie(movie)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch self.arrayData[indexPath.row] {
        case is Movie:
            return UITableView.automaticDimension
        case is String:
            return tableView.frame.height
        default:
            return 0
        }
    }
}
