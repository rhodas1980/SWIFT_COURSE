//
//  OptionViewController.swift
//  Parcial
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import UIKit

class OptionViewController: UIViewController {
    
    //para el boton de back de cada view
    @IBAction func clickBtnBack(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
    }
}
