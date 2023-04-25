//
//  AppCoordinator.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
    var navigationController: UINavigationController!
    private var window: UIWindow
    private var childCoordinator: Coordinator?

    init(window: UIWindow) {
        self.window = window
    }

    func start() {
        showCoordinator()
    }

    private func showCoordinator() {
        navigationController = UINavigationController()
        window.rootViewController = navigationController
        window.makeKeyAndVisible()

//        let coordinator = PlanCoordinator(navigationController: navigationController)
//        coordinator.start()
//        childCoordinator = coordinator

        let coordinator = RegisterPlanCoordinator(navigationController: navigationController)
        coordinator.start()
        childCoordinator = coordinator

    }

}
