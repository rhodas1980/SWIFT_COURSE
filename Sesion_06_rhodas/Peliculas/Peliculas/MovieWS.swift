//
//  MovieWS.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import Foundation
import Alamofire

struct MovieWS {
    
    func getAllMovies() {
        let urlString = "https://api.themoviedb.org/3/movie/popular?api_key=176de15e8c8523a92ff640f432966c9c"
        
        let request = AF.request(urlString, method: .get)
        
        request.response { dataResponse in
            //cuando se de la respuesta del servidor
            //print("Termino!")
            guard let data = dataResponse.data else {
                print("Ocurrio un problema. Intentelo mas tarde")
                return
            }
            let json = try? JSONSerialization.jsonObject(with: data, options: .fragmentsAllowed)
            print(json ?? "No se puede leer la trama")
            
            
        }
        
        //print("Hola!")
    }
    
    
}
