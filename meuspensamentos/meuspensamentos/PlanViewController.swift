//
//  PlanViewController.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.

import UIKit

protocol PlanViewControllerDelegate: AnyObject {
    func showRegisterPlan(plan: [Plan])
}

class PlanViewController: UIViewController {

    weak var delegate: PlanViewControllerDelegate?
    var model: PlanModel?
    var plans: [Plan] {
        return model?.plans ?? []
    }

    var titleLabel: UILabel = {  // ====>> Isso pode ficar em um arquivo separado como "Componente" <<====
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Planejamento Diário"
        view.textColor = .magenta
        view.font = UIFont.systemFont(ofSize: 22, weight: .medium)
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
        view.addSubview(tableview)
        configConstraints()
        configTableview()
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            barButtonSystemItem: .add,
            target: self,
            action: #selector(showAddPlan)
        )
        navigationItem.titleView = titleLabel
        navigationItem.backButtonTitle = "Voltar"
        model?.load()
    }

    @objc func showAddPlan() {
        self.delegate?.showRegisterPlan(plan: self.plans)
    }

    func configTableview() {
        tableview.dataSource = self
        tableview.delegate = self
        tableview.register(PlanTableViewCell.self, forCellReuseIdentifier: PlanTableViewCell.identifier)
    }

    func configConstraints() {
        NSLayoutConstraint.activate([
            tableview.topAnchor.constraint(equalTo: view.topAnchor, constant: 50),
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
