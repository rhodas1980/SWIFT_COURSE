//
//  HomeViewController.swift
//  Parcial
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import UIKit

class HomeViewController: UIViewController {
    
    //para el constraint del ScrollView
    @IBOutlet private weak var anchorBottom: NSLayoutConstraint!
    
    //para alterar la cantidad de lineas del label
    @IBOutlet private weak var lblContent: UILabel!
    
    //variable para controlar el numero de lineas
    private var isColapse = false
    
    //para el botom see more , see less
    @IBAction private func clickBtnSeeMore(_ sender: UIButton) {
        UIView.animate(withDuration: 0.3) {
            //para ver mas lineas
            self.lblContent.numberOfLines = self.isColapse ? 2 : 0 //ternario
            //para cambiar el label
            sender.setTitle(self.isColapse ? "Ver más" : "Ver menos", for: .normal) //ternario
            //para ver menos lineas
            self.isColapse = !self.isColapse
            self.view.layoutIfNeeded()
        }
    }
    
    //para la accion tap to close
    @IBAction private func tapToClose(_ sender: UITapGestureRecognizer) {
        self.view.endEditing(true)
    }
    
    //se le hace el seguimiento al observador
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.registerKeyboardEvents()
    }
    
    //se deja de seguir al observador
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.unregisterKeyboardEvents()
    }
}

//para controlar los eventos del teclado
extension HomeViewController {
    private func registerKeyboardEvents() {
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillShow(_:)), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(self.keyboardWillHide(_:)), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    private func unregisterKeyboardEvents() {
        NotificationCenter.default.removeObserver(self)
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
        //la duracion de la animacion
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        //y la altura del teclado
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        //para setear el constraint de anchorBottom a la altura del frame del keyboard
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottom.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
    }
    @objc private func keyboardWillHide(_ notification: Notification){
        //la duracion de la animacion
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        //para setear el constraint de anchorBottom a cero
        UIView.animate(withDuration: animationDuration) {
            self.anchorBottom.constant = 0
            self.view.layoutIfNeeded()
        }
    }
}

