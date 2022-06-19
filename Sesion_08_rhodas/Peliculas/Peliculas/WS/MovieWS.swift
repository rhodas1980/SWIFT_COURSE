//
//  MovieWS.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import Foundation
import Alamofire
import UIKit

//() -> Void

typealias MoviesHandler = (_ arrayMoviesDTO: [MovieDTO]) -> Void


struct MovieWS {
    
    
    
    //agregamos un parametro "succes" dentro de la func getAllMovies
    //para poder determinar la culminacion del proceso.
    //succes es una funcion y su tipo es "(_ arrayMovies: [Movie]) -> Void)"
    //el @escaping determina que el tipo "MovieHandler" es asincrono
    
    func getAllMovies(success: @escaping MoviesHandler) {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        
        let request = AF.request(urlString, method: .get)
        
        //response es un proceso asincrono
        request.response { dataResponse in
            //cuando se de la respuesta del servidor
            //print("Termino!")
            guard let data = dataResponse.data else {
                print("Ocurrio un problema. Intentelo mas tarde")
                return
            }
            
            //decofificador que convierte la data en tipo PageMovieDTO
            let decoder = JSONDecoder()
            let pageMovie = try? decoder.decode(PageMovieDTO.self,from: data)
            success(pageMovie?.results ?? [])
            
            
            /*
            let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            print(json ?? "No se puede leer la trama")
            
            let array = [Movie]()
            
            // a la funcion succes se le envia el array de movies
            succes(array)
             */
            
            
        }
        
        //print("Hola!")
    }
    
    
}
