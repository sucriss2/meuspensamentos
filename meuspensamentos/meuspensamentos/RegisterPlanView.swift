//
//  RegisterPlanView.swift
//  meuspensamentos
//
//  Created by Suh on 20/04/23.
//

import UIKit

final class RegisterPlanView: UIView, UITextFieldDelegate {

    private var mainView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        return view
    }()

    private var stackview: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.distribution = .equalSpacing
        view.spacing = 8
        view.isLayoutMarginsRelativeArrangement = true
        view.layoutMargins = UIEdgeInsets(top: 0, left: 16, bottom: 0, right: 16)
        return view
    }()

    private var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Cadastro"
        label.textColor = .magenta
        label.font = UIFont.systemFont(ofSize: 36, weight: .semibold)
        return label
    }()

    var titleTextFild: UITextField = {
        var view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.placeholder = "Titulo"
        view.text = ""
        view.font = UIFont.systemFont(ofSize: 22)
        view.layer.cornerRadius = 6
        return view
    }()

    var subtitleTextFild: UITextField = {
        var view = UITextField(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .systemGray5
        view.placeholder = "Observação"
        view.text = ""
        view.accessibilityScroll(.down)
        view.font = UIFont.systemFont(ofSize: 20, weight: .regular)
        view.frame.size.height = 80
        view.layer.cornerRadius = 6
        return view
    }()

    private var dateLabel: UILabel = {
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

    var titleText: String {
        get {
            return titleTextFild.text ?? ""
        }

        set {
            titleTextFild.text = newValue
        }
    }

    var subText: String {
        get {
            return subtitleTextFild.text ?? ""
        }

        set {
            return subtitleTextFild.text = newValue
        }
    }

    init() {
        super.init(frame: .zero)
        setupView()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}

extension RegisterPlanView: CodeView {
    func buidViewHierarchy() {
        addSubview(mainView)
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
        confirmButton.addTarget(self, action: #selector(addPlan), for: .touchUpInside)
    }

    @objc private func addPlan() {
        print("=====>> Chegamos AQUI ") // adicionar e salvar as informacoes na tela da PlanView e no userDefault
        confirmButton.backgroundColor = .purple
    }

}

// ---------

//    import SwiftUI
//
//    struct PlaygroundView: UIViewRepresentable {
//        func makeUIView(context: Context) -> some UIView {
//            RegisterPlanView()
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
