//
//  MainViewController.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import UIKit

class MainViewController: UIViewController {

    var screen = MainView()

    override func viewDidLoad() {
        super.viewDidLoad()
//        view.backgroundColor = .orange
        view = screen
    }

}
