//
//  PlanCellTableViewCell.swift
//  meuspensamentos
//
//  Created by Suh on 24/04/23.

import UIKit

class PlanTableViewCell: UITableViewCell {

    static let identifier = "PlanCell"

    lazy var mainView: UIView = {
        let view = UIView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .clear
        return view
    }()

    lazy var cellStackView: UIStackView = {
        let view = UIStackView(frame: .zero)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isLayoutMarginsRelativeArrangement = true
        view.axis = .vertical
        view.spacing = 4
        view.distribution = .fill
        view.backgroundColor = .clear
        return view
    }()

    lazy var labelDateStack: UIStackView = {
        var stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 8
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        stackView.backgroundColor = UIColor(red: 1.0, green: 0.843, blue: 0.886, alpha: 1)

        return stackView
    }()

    lazy var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .systemPurple
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()

    lazy var dateLabel: UILabel = {
        var date = UILabel(frame: .zero)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.text = ""
        date.font = .boldSystemFont(ofSize: 16)
        return date
    }()

    lazy var textMainLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        label.textAlignment = .left
        label.numberOfLines = 2
        label.font = .systemFont(ofSize: 18, weight: .regular)
        label.backgroundColor = UIColor(red: 0.950, green: 0.843, blue: 0.886, alpha: 1)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(mainView)
        labelDateStack.addArrangedSubview(titleLabel)
        labelDateStack.addArrangedSubview(dateLabel)
        cellStackView.addArrangedSubview(labelDateStack)
        cellStackView.addArrangedSubview(textMainLabel)
        mainView.addSubview(cellStackView)
        configConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(model: Plan) {
        titleLabel.text = model.title
        textMainLabel.text = model.text
        dateLabel.text = model.date
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        textMainLabel.text = nil
        dateLabel.text = nil
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            mainView.topAnchor.constraint(equalTo: self.topAnchor),
            mainView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            mainView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            mainView.bottomAnchor.constraint(equalTo: self.bottomAnchor),

            cellStackView.topAnchor.constraint(equalTo: mainView.topAnchor, constant: 8),
            cellStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 16),
            cellStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: -16),
            cellStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor, constant: -8)
        ])

    }

}
//
// import SwiftUI
//
// struct PlaygroundView: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        PlanTableViewCell()
//    }
//
//    func updateUIView(_ uiView: UIViewType, context: Context) {
//
//    }
// }
//
// struct PlaygroundView_Previews: PreviewProvider {
//    static var previews: some View {
//        PlaygroundView()
//    }
// }
