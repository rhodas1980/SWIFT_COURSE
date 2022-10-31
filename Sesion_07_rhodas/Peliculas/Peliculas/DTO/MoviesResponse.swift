//
//  MoviesResponse.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

//DTO objetc data transfer

import Foundation

//representa al objecto principal Json
struct PageMovieDTO: Decodable { //Decodable = A type that can decode itself from an external representation.
    let page: Int?
    let results: [MovieDTO]? //representa al array de objetos que esta dentro del objeto princiapal
    
}

struct MovieDTO: Decodable {
    let id: Int?
    let title: String?
    let vote_average: Double?
    let release_date: String?
    let poster_path: String?
    let overview: String?
}

/*
extension MovieDTO {
    var toMovie: Movie {
        return Movie(dto: self)
    }
}
*/

//agregamos una funcionalidad a la clase
extension MovieDTO {
    var toMovie: Movie { Movie(dto: self) }
}

/*
//forma millonaria
extension Array where Element == MovieDTO {
    var toMovies: [Movie] {
        return self.map({ $0.toMovie })
    }
}
*/

//forma corta
//generamos una extension para todo Array que pertenesca a MovieDTO
extension Array where Element == MovieDTO {
    var toMovies: [Movie] { self.map({ $0.toMovie }) }
}


/*
//forma completa
extension Array where Element == MovieDTO {
    var toMovies: [Movie] {
        return self.map{ myDTO in
            return myDTO.toMovie
        }
    }
}
 */

/*
 
 //Forma barata
extension Array where Element == MovieDTO {
    var toMovies: [Movie] {
        var arrayMovies = [Movie]()
        
        for dto in self {
            arrayMovies.append(dto.toMovie)
        }
        return arrayMovies
    }
}
 */
