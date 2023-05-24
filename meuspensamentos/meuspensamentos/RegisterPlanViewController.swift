//
//  RegisterPlanViewController.swift
//  meuspensamentos
//
//  Created by Suh on 25/04/23.
//

import UIKit

class RegisterPlanViewController: UIViewController, UITextFieldDelegate {

    var screen: RegisterPlanView?
    var model: RegisterModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        view = screen
        title = "Cadastro"
        registerPlan()
    }

    func clearScreen() {
        guard let screen = screen else {
            return
        }
        screen.confirmButton.backgroundColor = .magenta
        screen.titleText = ""
        screen.subText = ""
        screen.isButtonEnabled = false

    }

    @objc private func addPlan() {
        guard let screen = screen else {
            return
        }
        if screen.titleText.isEmpty == false {
            let plan = Plan(title: screen.titleText, text: screen.subText, date: screen.dateString)
            model?.savePlan(plan)
        }
        clearScreen()
        screen.confirmButton.backgroundColor = .purple


    }

    func registerPlan() {
        screen?.confirmButton.addTarget(self, action: #selector(addPlan), for: .touchUpInside)
    }

}
