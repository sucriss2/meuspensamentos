//
//  MainViewController.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
// swiftlint:disable line_length

import UIKit

class MainViewController: UIViewController {

    let plans = ["Estudar English", "Organizar mesa de trabalho", "Fazer Exercicios", "Ajudar Lívia com atividades", "Anotar alimentaçao e água", "Planejar o dia de amanhã", "Estudar English", "Organizar mesa de trabalho", "Fazer Exercicios", "Ajudar Lívia com atividades", "Anotar alimentaçao e água", "Planejar o dia de amanhã", "Estudar English", "Organizar mesa de trabalho", "Fazer Exercicios", "Ajudar Lívia com atividades", "Anotar alimentaçao e água", "Planejar o dia de amanhã", "Estudar English", "Organizar mesa de trabalho", "Fazer Exercicios", "Ajudar Lívia com atividades", "Anotar alimentaçao e água", "Planejar o dia de amanhã" ]

    var titleLabel: UILabel = {  // ====>> Isso pode ficar em um arquivo separado como "Componente" <<====
        let view = UILabel(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.text = "Planejamento Diário"
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
        // view = screen
        view.backgroundColor = .systemMint
        view.addSubview(titleLabel)
        view.addSubview(tableview)
        configConstraints()
        configTableview()
    }

    func configTableview() {
        tableview.dataSource = self
        tableview.delegate = self
//        tableview.register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
    }

    func configConstraints() {
        NSLayoutConstraint.activate([
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: tableview.topAnchor, constant: -16),
            tableview.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tableview.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            tableview.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }

}

extension MainViewController: UITableViewDataSource, UITableViewDelegate {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return plans.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .default, reuseIdentifier: "")
        cell.textLabel?.text = plans[indexPath.row]
        return cell
    }

}
