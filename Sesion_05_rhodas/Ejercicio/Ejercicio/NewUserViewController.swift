//
//  NewUserViewController.swift
//  Ejercicio
//
//  Created by rhodas agapito angeles on 15/05/22.
//

import UIKit

class NewUserViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        print("NewUserViewController - viewDidLoad")
    }
    override func viewWillAppear(_ animated: Bool){
        super.viewWillAppear(animated)
        print("NewUserViewController - viewWillAppear")
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        print("NewUserViewController - viewDidAppear")
    }
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        print("NewUserViewController - viewWillDisappear")
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        print("NewUserViewController - viewDidDisappear")
    }
}
