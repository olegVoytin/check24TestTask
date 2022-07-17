//
//  NonAvailableProductCell.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class NonAvailableProductCell: UITableViewCell {

    private enum Constants {
        static let borderOffset: CGFloat = 16
        static let offsetToImage: CGFloat = 12
        static let verticalOffset: CGFloat = 4
    }

    private let productImageView: UIImageView = {
        let imageView = UIImageView().prepareForAutolayout()
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()

    private let nameLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        return label
    }()

    private let starsView = UIView().prepareForAutolayout()

    private let stackView: UIStackView = {
        let stack = UIStackView()
        stack.spacing = Constants.verticalOffset
        stack.axis = .vertical
        return stack
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupView()
    }

    override func prepareForReuse() {
        super.prepareForReuse()
        resetData()
    }

    func setup(with viewModel: NonAvailableProductCellViewModel) {

    }
}

private extension NonAvailableProductCell {

    func resetData() {
        productImageView.image = nil
        nameLabel.reset()
        descriptionLabel.reset()
    }

    func setupView() {
        createHierarchy()
        setupConstraints()
    }

    func createHierarchy() {
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(descriptionLabel)
        stackView.addArrangedSubview(starsView)
        contentView.addSubview(productImageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.borderOffset),
            stackView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.borderOffset),
            stackView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.borderOffset),

            productImageView.leftAnchor.constraint(equalTo: stackView.rightAnchor, constant: Constants.offsetToImage),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.borderOffset),
            productImageView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.borderOffset),
            productImageView.bottomAnchor.constraint(
                equalTo: contentView.bottomAnchor,
                constant: -Constants.borderOffset
            ),
        ])
    }
}
