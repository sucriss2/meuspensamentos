//
//  MainView.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import UIKit

final class MainView: UIView {

    private let mainView: UIView = {
        let view = UIView(frame: .zero)
        view.backgroundColor = .cyan
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension MainView: CodeView {
    func buidViewHierarchy() {
        addSubview(mainView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor)

        ])
    }

    func setupAdditionConfiguration() {

    }

}
