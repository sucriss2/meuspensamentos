//
//  MainCoordinator.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController!

    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }

    func start() {
        let mainVC = makeViewController()
        navigationController.pushViewController(mainVC, animated: true)
    }

    func makeViewController() -> MainViewController {
        let viewController = MainViewController()
        return viewController
    }

}
