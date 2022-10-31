//
//  MovieTableViewCell.swift
//  Peliculas
//
//  Created by rhodas agapito angeles on 18/06/22.
//

import UIKit
import Alamofire


class MovieTableViewCell: UITableViewCell {
    
    //imagen
    @IBOutlet private weak var imgMovie: UIImageView!
    //titulo
    @IBOutlet private weak var lblTitle: UILabel!
    //fecha de lanzamiento
    @IBOutlet private weak var lblReleaseDate: UILabel!
    //estrellas
    @IBOutlet private var arrayImages: [UIImageView]!
    
    public func updateData(_ movie: Movie){
        
        self.animateAppear()
        
        self.lblTitle.text = movie.title
        self.lblReleaseDate.text = movie.releaseDateFormat
        
        //para pintar las estrellas
        for (index, imageView) in self.arrayImages.enumerated(){
            imageView.image = index < movie.voteAverage ? UIImage(systemName: "star.fill") : UIImage(systemName: "star")
        }
        
        //hacemos un request a la url de imagenes con AlamoFire
        let request = AF.request(movie.urlImage)
        request.response { dataResponse in
            guard let data = dataResponse.data else { return }
            //asignamos la imagen de data a la imagen de la vista
            self.imgMovie.image = UIImage(data: data)
        }
    }
    
    //para darle radio a la imagen
    override func draw(_ rect: CGRect){
        super.draw(rect)
        self.imgMovie.layer.cornerRadius = 10
    }
    
    //matriz para dar un efecto traslucido
    private func animateAppear() {
        self.alpha = 0
        self.transform = CGAffineTransform(scaleX: 0.8, y: 0.8)
        
        //para animar la aparicion de la celda
        UIView.animate(withDuration: 0.9) {
            self.alpha = 1
            self.transform = .identity
        }
    }
}
