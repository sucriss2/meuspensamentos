//
//  RegisterPlanCoordinator.swift
//  meuspensamentos
//
//  Created by Suh on 25/04/23.
//

import UIKit

// protocol RegisterPlanCoordinatorDelegate: AnyObject {
//    func showPlan()
// }

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
        let screen = RegisterPlanView()
        let model = RegisterModel()

//        viewC.delegate = self
        viewC.model = model
        viewC.screen = screen
        return viewC
    }

}

//extension RegisterPlanCoordinator: RegisterPlanViewControllerDelegate {
//    func addPlanRegister() {
//        
//    }
//
//}
