//
//  PlanViewController.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.

import UIKit

class PlanViewController: UIViewController {

    var model: PlanModel?
    var plans: [Plan] {
        return model?.plans ?? []
    }

    var titleLabel: UILabel = {  // ====>> Isso pode ficar em um arquivo separado como "Componente" <<====
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Planejamento Diário"
        view.textColor = .magenta
        view.font = UIFont.boldSystemFont(ofSize: 28)
        return view
    }()

    lazy var tableview: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.scrollsToTop = true
        tableView.backgroundColor = .clear
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(titleLabel)
        view.addSubview(tableview)
        configConstraints()
        configTableview()
    }

    func configTableview() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(PlanTableViewCell.self, forCellReuseIdentifier: PlanTableViewCell.identifier)
    }

    func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: tableview.topAnchor, constant: -24),

            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension PlanViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: PlanTableViewCell.identifier, for: indexPath
        ) as? PlanTableViewCell else {
            fatalError()
        }
        let plan = plans[indexPath.row]
        cell.configure(model: plan)
        cell.backgroundColor = .clear
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }

}
