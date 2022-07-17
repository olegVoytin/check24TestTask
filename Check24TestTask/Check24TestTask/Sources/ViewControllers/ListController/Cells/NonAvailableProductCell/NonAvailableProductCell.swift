//
//  NonAvailableProductCell.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class NonAvailableProductCell: TableViewCell {

    private enum Constants {
        static let borderOffset: CGFloat = 16
        static let offsetToImage: CGFloat = 12
        static let verticalOffset: CGFloat = 4
    }

    private let cellBackgroundView = UIView().prepareForAutolayout()

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
        label.numberOfLines = 0
        label.textColor = .gray
        return label
    }()

    private let starsView = UIView().prepareForAutolayout()

    override func prepareForReuse() {
        super.prepareForReuse()
        resetData()
    }

    override func setupView() {
        createHierarchy()
        setupConstraints()
        setupBorder()
    }

    func setup(with viewModel: NonAvailableProductCellViewModel) {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description

        switch viewModel.type {
        case .triangle:
            productImageView.image = #imageLiteral(resourceName: "triangle").withTintColor(
                Color.hexStringToUIColor(hex: viewModel.colorCode),
                renderingMode: .alwaysOriginal
            )
        case .circle:
            productImageView.image = #imageLiteral(resourceName: "circle").withTintColor(
                Color.hexStringToUIColor(hex: viewModel.colorCode),
                renderingMode: .alwaysOriginal
            )
        case .hexagon:
            productImageView.image = #imageLiteral(resourceName: "hexagon").withTintColor(
                Color.hexStringToUIColor(hex: viewModel.colorCode),
                renderingMode: .alwaysOriginal
            )
        case .square:
            productImageView.image = #imageLiteral(resourceName: "square").withTintColor(
                Color.hexStringToUIColor(hex: viewModel.colorCode),
                renderingMode: .alwaysOriginal
            )
        case .other:
            break
        }
    }
}

private extension NonAvailableProductCell {

    func resetData() {
        productImageView.image = nil
        nameLabel.reset()
        descriptionLabel.reset()
    }

    func createHierarchy() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(nameLabel)
        cellBackgroundView.addSubview(descriptionLabel)
        cellBackgroundView.addSubview(starsView)
        cellBackgroundView.addSubview(productImageView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            cellBackgroundView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.borderOffset),
            cellBackgroundView.rightAnchor.constraint(
                equalTo: contentView.rightAnchor,
                constant: -Constants.borderOffset
            ),
            cellBackgroundView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 8),
            cellBackgroundView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),

            nameLabel.leftAnchor.constraint(equalTo: cellBackgroundView.leftAnchor, constant: Constants.borderOffset),
            nameLabel.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: Constants.borderOffset),
            nameLabel.rightAnchor.constraint(equalTo: productImageView.leftAnchor, constant: -Constants.offsetToImage),

            descriptionLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: Constants.verticalOffset),
            descriptionLabel.leftAnchor.constraint(
                equalTo: cellBackgroundView.leftAnchor,
                constant: Constants.borderOffset
            ),
            descriptionLabel.rightAnchor.constraint(
                equalTo: productImageView.leftAnchor,
                constant: -Constants.offsetToImage
            ),

            starsView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.verticalOffset),
            starsView.leftAnchor.constraint(
                equalTo: cellBackgroundView.leftAnchor,
                constant: Constants.borderOffset
            ),
            starsView.rightAnchor.constraint(
                equalTo: productImageView.leftAnchor,
                constant: -Constants.offsetToImage
            ),
            starsView.bottomAnchor.constraint(
                equalTo: cellBackgroundView.bottomAnchor,
                constant: -Constants.borderOffset
            ),

            productImageView.topAnchor.constraint(
                equalTo: cellBackgroundView.topAnchor, constant: Constants.borderOffset
            ),
            productImageView.rightAnchor.constraint(
                equalTo: cellBackgroundView.rightAnchor,
                constant: -Constants.borderOffset
            ),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            productImageView.widthAnchor.constraint(equalToConstant: 60),
        ])
    }

    func setupBorder() {
        cellBackgroundView.layer.borderColor = UIColor.gray.cgColor
        cellBackgroundView.layer.borderWidth = 1
    }
}
