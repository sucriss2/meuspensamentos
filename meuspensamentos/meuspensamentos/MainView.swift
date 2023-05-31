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

    var mainLabel: UILabel = {
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Planejamento Diário"
        view.font = UIFont.boldSystemFont(ofSize: 32)
//        view.backgroundColor = .purple
        return view
    }()

    var tableView: UITableView = {
        let view = UITableView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemTeal
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
        mainView.addSubview(mainLabel)
        mainView.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            mainLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 30),
            mainLabel.centerXAnchor.constraint(equalTo: mainView.centerXAnchor),
            mainLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -16),

            tableView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)

        ])
    }

    func setupAdditionConfiguration() {

    }

}
