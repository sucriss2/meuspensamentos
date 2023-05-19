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
        view.layoutMargins = UIEdgeInsets(top: 8, left: 8, bottom: 8, right: 8)
        view.axis = .vertical
        view.distribution = .fill
        view.backgroundColor = .clear
        return view
    }()

    lazy var labelDateStack: UIStackView = {
        var stackView = UIStackView(frame: .zero)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.spacing = 16
        stackView.distribution = .fill
        stackView.backgroundColor = .clear
        return stackView
    }()

    lazy var dateLabel: UILabel = {
        var date = UILabel(frame: .zero)
        date.translatesAutoresizingMaskIntoConstraints = false
        date.text = ""
        date.font = .boldSystemFont(ofSize: 18)
        return date
    }()

    lazy var titleLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .systemPurple
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.backgroundColor = .clear
        return label
    }()

    lazy var textMainLabel: UILabel = {
        var label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .black
        label.numberOfLines = 3
        label.font = .systemFont(ofSize: 16, weight: .regular)
        label.backgroundColor = .systemGray6
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

            cellStackView.topAnchor.constraint(equalTo: mainView.topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor)
        ])
    }

}

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
