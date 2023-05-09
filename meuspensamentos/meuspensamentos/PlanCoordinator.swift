//
//  PlanCoordinator.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import UIKit

class PlanCoordinator: Coordinator {
    var navigationController: UINavigationController!
    private var childCoordinator: RegisterPlanCoordinator!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let planVC = makeViewController()
        navigationController.pushViewController(planVC, animated: true)
    }

    func makeViewController() -> PlanViewController {
        let viewController = PlanViewController()
        let model = PlanModel()

        viewController.model = model
        viewController.delegate = self

        return viewController
    }

}

extension PlanCoordinator: PlanViewControllerDelegate {
    func showRegisterPlan() {
        let rpCoordinator = RegisterPlanCoordinator(navigationController: navigationController)
        rpCoordinator.start()
        childCoordinator = rpCoordinator
    }

}
