//
//  PlanManagerView.swift
//  meuspensamentos
//
//  Created by Suh on 20/04/23.
//

import UIKit

final class PlanManagerView: UIView {

    var mainView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    var stackview: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .fill
        view.spacing = 8
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return view
    }()

    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastro"
        label.textColor = .magenta
        label.font = UIFont.systemFont(ofSize: 28, weight: .semibold)
        return label
    }()

    var titleTextFild: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.placeholder = "Titulo"
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 22)
        view.layer.cornerRadius = 6
        return view
    }()

    var subtitleTextFild: UITextField = {
        let view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.placeholder = "Observação"
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 18, weight: .regular)
        view.layer.cornerRadius = 6
        return view
    }()

    var dateLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Data do Plano"
        label.textColor = .systemPurple
        return label
    }()

    var datepickerPlan: UIDatePicker = {
        let view = UIDatePicker(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.datePickerMode = .dateAndTime
        view.preferredDatePickerStyle = .wheels
        view.minuteInterval = 5
        view.date = .now
        view.tintColor = .systemPink
        view.locale = Locale(identifier: "pt_BR")
        return view
    }()

    var confirmButton: UIButton = {
        let button = UIButton(frame: .zero)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.backgroundColor = .magenta
        button.titleLabel?.font = .boldSystemFont(ofSize: 24.0)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Confirmar Plano", for: .normal)
        button.layer.cornerRadius = 8
        return button
    }()

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension PlanManagerView: CodeView {
    func buidViewHierarchy() {
        addSubview(mainView)
        stackview.addArrangedSubview(titleLabel)
        stackview.addArrangedSubview(titleTextFild)
        stackview.addArrangedSubview(subtitleTextFild)
        stackview.addArrangedSubview(dateLabel)
        stackview.addArrangedSubview(datepickerPlan)
        stackview.addArrangedSubview(confirmButton)
        mainView.addSubview(stackview)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            stackview.centerYAnchor.constraint(equalTo: mainView.centerYAnchor),
            stackview.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            stackview.trailingAnchor.constraint(equalTo: mainView.trailingAnchor)
        ])

    }

    func setupAdditionConfiguration() {

    }

}

// ---------

//    import SwiftUI
//
//    struct PlaygroundView: UIViewRepresentable {
//        func makeUIView(context: Context) -> some UIView {
//            PlanManagerView()
//        }
//
//        func updateUIView(_ uiView: UIViewType, context: Context) {
//
//        }
//    }
//
//    struct PlaygroundView_Previews: PreviewProvider {
//        static var previews: some View {
//            PlaygroundView()
//        }
//    }
