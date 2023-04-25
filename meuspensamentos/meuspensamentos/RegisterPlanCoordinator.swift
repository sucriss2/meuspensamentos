//
//  RegisterPlanCoordinator.swift
//  meuspensamentos
//
//  Created by Suh on 25/04/23.
//

import UIKit

class RegisterPlanCoordinator: Coordinator {
    var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let vcReg = makeViewController()
        navigationController.pushViewController(vcReg, animated: true)
    }

    func makeViewController() -> RegisterPlanViewController {
        let viewC = RegisterPlanViewController()
        return viewC
    }

}
