//
//  MoviesViewController.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import UIKit

//modelo abstracto
protocol MoviesViewProtocol: NSObjectProtocol {
    func didFilterWithResult(_ arrayData: [Any])
    func didSelectMovie(_ movie: Movie)
}

class MoviesViewController: UIViewController {
    
    //creacion de un table view
    @IBOutlet private weak var tlvMovies: UITableView!
    
    //crecion de una barra de busqueda
    @IBOutlet private weak var srcMovies: UISearchBar!
    
    lazy var listAdapter = ListMoviesAdapter(controller: self)
    lazy var searchAdapter = SearchMovieAdapter(controller: self)
    
    lazy var refreshControl: UIRefreshControl = {
        let resfresh = UIRefreshControl()
        //cuando el refresh control llega al punto maximo de
        //jalado de .valueChanged
        //activa pullToRefresh
        resfresh.addTarget(self, action: #selector(self.pullToRefresh(_:)), for: .valueChanged)
        return resfresh
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tlvMovies.addSubview(self.refreshControl)
        self.setupAdapters()
        self.getAllMovies()
    }
    
    @objc func pullToRefresh(_ sender: UIRefreshControl){
        self.getAllMovies()
    }
    
    private func setupAdapters() {
        self.tlvMovies.dataSource = self.listAdapter
        //el delegate adopta el protocolo
        self.tlvMovies.delegate = self.listAdapter
        //para acceder a la barra de busqueda
        self.srcMovies.delegate = self.searchAdapter
    }
    
    private func getAllMovies(){
        let ws = MovieWS()
        //el desplazamiento del table view activa
        // al refresh control
        self.refreshControl.beginRefreshing()
        
        ws.getAllMovies { arrayMoviesDTO in
            
            self.refreshControl.endRefreshing()
            let arrayMovies = arrayMoviesDTO.toMovies
            
            
            self.listAdapter.arrayData = arrayMovies
            self.searchAdapter.arrayData = arrayMovies
            
            //recarga el tableview
            self.tlvMovies.reloadData()
        }
    }
}

extension MoviesViewController: MoviesViewProtocol {
    func didSelectMovie(_ movie: Movie) {
        print(movie.title)
    }
    
    //este metodo le dice al adapter de la lista que le
    //va a pasar el arrayData y al tableView le dice
    //haga un reloadData
    func didFilterWithResult(_ arrayData: [Any]) {
        self.listAdapter.arrayData = arrayData
        self.tlvMovies.reloadData()
    }
}
