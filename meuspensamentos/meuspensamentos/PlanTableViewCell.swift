//
//  PlanCellTableViewCell.swift
//  meuspensamentos
//
//  Created by Suh on 24/04/23.

import UIKit

class PlanTableViewCell: UITableViewCell {

    static let identifier = "PlanCell"

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

    lazy var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = ""
        label.textColor = .systemPurple
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.backgroundColor = .clear
        return label
    }()

    lazy var textMainLabel: UILabel = {
        let label = UILabel(frame: .zero)
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
        addSubview(cellStackView)
        cellStackView.addArrangedSubview(titleLabel)
        cellStackView.addArrangedSubview(textMainLabel)
        configConstraints()

    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    public func configure(model: Plan) {
        titleLabel.text = model.title
        textMainLabel.text = model.text
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
        textMainLabel.text = nil
    }

    private func configConstraints() {
        NSLayoutConstraint.activate([
            cellStackView.topAnchor.constraint(equalTo: self.topAnchor),
            cellStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            cellStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            cellStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }

}

// import SwiftUI
//
// struct PlaygroundView: UIViewRepresentable {
//    func makeUIView(context: Context) -> some UIView {
//        PlanCellTableViewCell()
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
