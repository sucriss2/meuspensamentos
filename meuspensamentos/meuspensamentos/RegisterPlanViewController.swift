//
//  RegisterPlanViewController.swift
//  meuspensamentos
//
//  Created by Suh on 25/04/23.
//

import UIKit

class RegisterPlanViewController: UIViewController {

    var screen = RegisterPlanView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        title = "Cadastro"
    }

}
