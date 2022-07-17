//
//  FilterView.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class FilterView: View {

    private let stackView: UIStackView = {
        let stack = UIStackView().prepareForAutolayout()
        stack.axis = .horizontal
        return stack
    }()

    override func initialization() {
        backgroundColor = .gray
        createHierarchy()
        setupConstraints()
    }

    func setup(with viewModel: FilterViewModel) {
        viewModel.filters.forEach {
            let button = UIButton().prepareForAutolayout()
            button.setTitle($0.rawValue, for: .normal)

//            switch $0 {
//            case .all:
//                button.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
//            case .available:
//                button.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
//            case .favourite:
//                button.addTarget(self, action: <#T##Selector#>, for: .touchUpInside)
//            case .other:
//                break
//            }
        }
    }

    private func createHierarchy() {
        addSubview(stackView)
    }

    private func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: leftAnchor, constant: 16),
            stackView.rightAnchor.constraint(equalTo: rightAnchor, constant: -16),
            stackView.topAnchor.constraint(equalTo: topAnchor, constant: 4),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -4),
            self.heightAnchor.constraint(equalToConstant: 60)
        ])
    }
}
