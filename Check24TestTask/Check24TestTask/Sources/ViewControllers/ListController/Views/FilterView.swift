//
//  FilterView.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class FilterView: View {

    private let label: UILabel = {
        let label = UILabel().prepareForAutolayout()
        label.text = "Check24TestTask"
        label.textAlignment = .center
        return label
    }()

    override func initialization() {
        backgroundColor = .gray
        createHierarchy()
        setupConstraints()
    }

    private func createHierarchy() {
        addSubview(label)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            label.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            label.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            label.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
        ])
    }
}
