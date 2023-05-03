//
//  RegisterPlanViewController.swift
//  meuspensamentos
//
//  Created by Suh on 25/04/23.
//

import UIKit

protocol RegisterPlanViewControllerDelegate: AnyObject {
    func addPlanRegister()
}

class RegisterPlanViewController: UIViewController {

    var screen = RegisterPlanView()
    weak var delegate: RegisterPlanViewControllerDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        title = "Cadastro"
    }

    func registerPlan() {

    }

}
