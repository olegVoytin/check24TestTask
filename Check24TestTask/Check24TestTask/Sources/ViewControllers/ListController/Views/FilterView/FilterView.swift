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
        stack.distribution = .fillEqually
        return stack
    }()

    var onTapFilter: ((FilterViewModel.Filter) -> Void)?

    override func initialization() {
        backgroundColor = .gray
        createHierarchy()
        setupConstraints()
    }

    func setup(with viewModel: FilterViewModel) {
        viewModel.filters.forEach {
            let button = FilterButton().prepareForAutolayout()
            button.filter = $0
            button.setTitle($0.rawValue, for: .normal)
            button.addTarget(self, action: #selector(onTapButton), for: .touchUpInside)
            stackView.addArrangedSubview(button)
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

    @objc
    private func onTapButton(_ selector: FilterButton) {
        onTapFilter?(selector.filter)
    }
}
