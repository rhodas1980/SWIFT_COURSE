//
//  Movie.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import Foundation
import UIKit

struct Movie {
    
    let id: Int
    let title: String
    let voteAverage: Double
    let releaseDate: Date?
    let posterPath: String
    let overView: String
    
    //test
    //let color: UIColor
    
    var releaseDateFormat: String {
        guard let date = self.releaseDate else {
            return "Proximamente"
        }
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "EEEE dd 'de' MMMM 'del' yyyy"
        //Miercoles 1 de junio del 2022
        dateFormatter.locale = Locale(identifier: "es_pe")
        
        let dateString = dateFormatter.string(from: date)
        return dateString
        
    }
    
    
    
    
    init(dto: MovieDTO){
        self.id = dto.id ?? 0
        self.title = dto.title ?? "--"
        self.voteAverage = dto.vote_average ?? 0
        self.overView = dto.overview ?? "Sin descripcion"
        self.posterPath = dto.poster_path ?? ""
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        dateFormatter.locale = Locale(identifier: "es_pe")
        self.releaseDate = dateFormatter.date(from: dto.release_date ?? "")
        
        /*
        //test
        let r = CGFloat.random(in: 0...255) / 255.0
        let g = CGFloat.random(in: 0...255) / 255.0
        let b = CGFloat.random(in: 0...255) / 255.0
        self.color = UIColor(displayP3Red: r, green: g, blue: b, alpha: 1)
        */
        
    }
    
}




