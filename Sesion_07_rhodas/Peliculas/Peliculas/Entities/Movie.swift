//
//  Movie.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import Foundation
import UIKit

//esta entidad es la que filtra la data que se mostrara a la UI
struct Movie {
    
    let id: Int
    let title: String
    let voteAverage: Double
    let releaseDate: Date?
    let posterPath: String
    let overView: String
    
    //test
    //let color: UIColor
    
    //creamos una propiedad/variable computada
    var releaseDateFormat: String {
        //validamos
        guard let date = self.releaseDate else {
            return "Proximamente"
        }
        //aplicamos el formato
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd 'de' MMMM 'del' yyyy" //Ejemplo = Miercoles 1 de junio del 2022
        dateFormatter.locale = Locale(identifier: "es_pe")
        let dateString = dateFormatter.string(from: date)
        return dateString
        
    }
    
    
    //DTO = Objeto de Transferencia de Informacion
    
    //el constructor recibe un MovieDTO
    init(dto: MovieDTO){
        self.id = dto.id ?? 0
        self.title = dto.title ?? "--"
        self.voteAverage = dto.vote_average ?? 0
        self.overView = dto.overview ?? "Sin descripcion"
        self.posterPath = dto.poster_path ?? ""
        
        //para convertir el tipo String que viene de la clase MovieResponse
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd" //la fecha viene en este formato del json
        dateFormatter.locale = Locale(identifier: "es_pe") //para cambiar al formato especificado por el identifier
        self.releaseDate = dateFormatter.date(from: dto.release_date ?? "") //dar formato a:  "dto.release_date"
        /*
        //test
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        self.color = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        */
        
    }
    
}




