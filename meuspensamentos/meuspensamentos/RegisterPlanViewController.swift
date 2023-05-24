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
        screen?.confirmButton.backgroundColor = .magenta
        screen?.titleText = ""
        screen?.subText = ""
    }

    @objc private func addPlan() {

        guard let screen = screen else {
            return
        }

        let plan = Plan(title: screen.titleText, text: screen.subText, date: screen.dateString)
        screen.confirmButton.backgroundColor = .purple
        clearScreen()
        model?.savePlan(plan)

    }

    func registerPlan() {
        screen?.confirmButton.addTarget(self, action: #selector(addPlan), for: .touchUpInside)

    }

}
