//
//  RegisterPlanCoordinator.swift
//  meuspensamentos
//
//  Created by Suh on 25/04/23.
//

import UIKit

class RegisterPlanCoordinator: Coordinator {
    var navigationController: UINavigationController!
    private var plan: [Plan]

    init(plan: [Plan], navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.plan = plan
    }

    func start() {
        let vcReg = makeViewController()
        navigationController.pushViewController(vcReg, animated: true)
    }

    func makeViewController() -> RegisterPlanViewController {
        let viewC = RegisterPlanViewController()
        let screen = RegisterPlanView()
        let model = RegisterModel()
        let service = PlanManager()

        viewC.model = model
        viewC.screen = screen
        model.service = service
        return viewC
    }

}
