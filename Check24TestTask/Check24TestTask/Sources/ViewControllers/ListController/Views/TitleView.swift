//
//  TitleView.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class TitleView: View {

    private let label: UILabel = {
        let label = UILabel().prepareForAutolayout()
        label.text = "Check24TestTask"
        label.textColor = .white
        label.textAlignment = .center
        return label
    }()

    override func initialization() {
        backgroundColor = .blue
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
            label.centerYAnchor.constraint(equalTo: centerYAnchor),
            self.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
