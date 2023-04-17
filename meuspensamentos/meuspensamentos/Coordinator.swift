//
//  Coordinator.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import UIKit

protocol Coordinator {
    var navigationController: UINavigationController! { get set }
    func start()
}
