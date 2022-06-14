//
//  LoginViewController.swift
//  Ejercicio
//
//  Created by rhodas agapito angeles on 15/05/22.
//

import UIKit

class LoginViewController: UIViewController {
    //vista caja ploma referencia
    @IBOutlet weak var viewContent: UIView!
    //constraint ancla  centro y (llamado originalmente: Align Center Y)
    @IBOutlet weak var anchorContentCenterY: NSLayoutConstraint!
    //text field user
    @IBOutlet weak var txtUser: UITextField!
    
    //gesture taptoclose para cerrar todos los elementos del
    //view que esten editandose
    @IBAction private func tapToCloseKeyboard(sender: UITapGestureRecognizer){
        self.view.endEditing(true)
    }
    
    //gesture swipetoclose
    @IBAction private func swipeToCloseKeyboard(_ sender: UISwipeGestureRecognizer){
        self.view.endEditing(true)
        
    }
    //gesture swipetoOpen
    @IBAction private func swipeToOpenKeyboard(_ sender: UISwipeGestureRecognizer){
        self.txtUser.becomeFirstResponder()
        
    }

    //metodos de la clase vista
    /*
    override func viewDidLoad() {
        super.viewDidLoad()
        print("LoginViewController - viewDidLoad")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("LoginViewController - viewDidDisappear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("LoginViewController - viewDidAppear")
    }
    
    */
    
    //metodo para sobreescribir la clase padre viewWillAppear
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("LoginViewController - viewWillAppear")
        self.registerKeyboardNotifications()
    }
    //metodo para sobreescribir la clase padre viewWillDisappear
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("LoginViewController - viewWillDisappear")
        self.unregisterKeyboardNotifications()
    }
    
}
    
    //MARK: - Keyboard Events
    //extension para OBSERVAR los eventos del teclado:
    //.keyboardWillShow y .keyboardWillHide

    extension LoginViewController {
        
        //funcion para seguir al teclado
        private func registerKeyboardNotifications(){
            //NotificationCenter , sirve para comunicar clases
            //tambien es un mediador entre el login y el teclado
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.keyboardWillShow(_:)),
                                                   name: UIResponder.keyboardWillShowNotification,
                                                   object: nil)
            NotificationCenter.default.addObserver(self,
                                                   selector: #selector(self.keyboardWillHide(_:)),
                                                   name: UIResponder.keyboardWillHideNotification,
                                                   object: nil)
        }
        //funcion para dejar seguir al teclado
        private func unregisterKeyboardNotifications(){
            NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillShowNotification, object: nil)
            NotificationCenter.default.removeObserver(self,name: UIResponder.keyboardWillHideNotification, object: nil)
        }
        
        //Metodo que captura cuando aparece el teclado
        @objc private func keyboardWillShow(_ notification: Notification){
            //print("TECLADO APARECE")
            //print(notification.userInfo ?? "SIN DATA")
            let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? CGRect ?? .zero
            
            print("keyboardFrame.origin.y = \(keyboardFrame.origin.y)")
            print("self.viewContent.frame.maxY = \(self.viewContent.frame.maxY)")
            
            if keyboardFrame.origin.y < self.viewContent.frame.maxY {
                
                UIView.animate(withDuration: animationDuration) {
                    self.anchorContentCenterY.constant = keyboardFrame.origin.y - self.viewContent.frame.maxY
                    self.view.layoutIfNeeded()
                }
                
            }
        }
        
        //Metodo que captura cuando desaparece el teclado
        @objc private func keyboardWillHide(_ notification: Notification){
            //print("TECLADO DESAPARECE")
            let animationDuration = notification.userInfo?[UIResponder.keyboardAnimationDurationUserInfoKey] as? Double ?? 0
            UIView.animate(withDuration: animationDuration) {
                self.anchorContentCenterY.constant = 0
                self.view.layoutIfNeeded()
            }
            
        }
        
    }

