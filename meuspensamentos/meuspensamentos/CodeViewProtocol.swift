//
//  CodeViewProtocol.swift
//  meuspensamentos
//
//  Created by Suh on 17/04/23.
//

import Foundation

protocol CodeView {
    func buidViewHierarchy()
    func setupConstraints()
    func setupAdditionConfiguration()
    func setupView()
}

extension CodeView {
    func setupView() {
        buidViewHierarchy()
        setupConstraints()
        setupAdditionConfiguration()
    }
}
