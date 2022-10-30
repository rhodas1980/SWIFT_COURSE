//
//  DetailViewController.swift
//  Constraints2
//
//  Created by rhodas agapito angeles on 15/06/22.
//

import UIKit

class DetailViewController: UIViewController {
    
    //para acceder al constraint de bottom de la caja de texto que cierra con el scroll view
    @IBOutlet private weak var anchorBottomScroll: NSLayoutConstraint!
    
    //para acceder al gesture implementado en el view
    @IBAction private func tapTocloseKeyboard(_ sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    //aparece la vista
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        //nos registramos
        self.registerKeyboardNotifications()
    }
    
    //desaparece la vista
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        //unregister keyboard
        self.unregisterKeyboardNotifications()
    }
    
    
    
}

extension DetailViewController {
    
    private func registerKeyboardNotifications() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillShow(_:)),
                                               name: UIResponder.keyboardWillShowNotification,
                                               object: nil)
        
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(self.keyboardWillHide(_:)),
                                               name: UIResponder.keyboardWillHideNotification,
                                               object: nil)
        
        
        
    }
    
    private func unregisterKeyboardNotifications() {
        NotificationCenter.default.removeObserver(self)
        
    }
    
    @objc private func keyboardWillShow(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
        
        UIView.animate(withDuration: animationDuration){
            //el constraint de bottom sera igual a la altura del frame del keyboard
            self.anchorBottomScroll.constant = keyboardFrame.height
            self.view.layoutIfNeeded()
        }
        
    }
    
    @objc private func keyboardWillHide(_ notification: Notification){
        let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
        
        UIView.animate(withDuration: animationDuration){
            //el constraint de bottom sera igual a cero cuando el teclado se oculte
            self.anchorBottomScroll.constant = 0
            self.view.layoutIfNeeded()
        }
        
        
        
    }
}
