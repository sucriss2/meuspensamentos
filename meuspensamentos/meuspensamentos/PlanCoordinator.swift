//
//  PlanCoordinator.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import UIKit

class PlanCoordinator: Coordinator {
    var navigationController: UINavigationController!

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

        return viewController
    }

}
