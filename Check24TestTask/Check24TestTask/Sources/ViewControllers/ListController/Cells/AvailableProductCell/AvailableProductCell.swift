//
//  AvailableProductCell.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class AvailableProductCell: TableViewCell {

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

    private let dateLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        label.textColor = .gray
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        label.textColor = .gray
        label.numberOfLines = 0
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        return label
    }()

    private let starsView = UIView().prepareForAutolayout()
    private let nameView = UIView().prepareForAutolayout()
    private let priceView = UIView().prepareForAutolayout()

    override func prepareForReuse() {
        super.prepareForReuse()
        resetData()
    }

    override func setupView() {
        createHierarchy()
        setupConstraints()
        setupBorder()
    }

    func setup(with viewModel: AvailableProductCellViewModel) {
        nameLabel.text = viewModel.name
        descriptionLabel.text = viewModel.description
        dateLabel.text = getDateString(timestamp: viewModel.releaseDate)

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

private extension AvailableProductCell {

    func resetData() {
        productImageView.image = nil
        nameLabel.reset()
        descriptionLabel.reset()
        priceLabel.reset()
        dateLabel.reset()
    }

    func createHierarchy() {
        contentView.addSubview(cellBackgroundView)
        cellBackgroundView.addSubview(productImageView)
        cellBackgroundView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        nameView.addSubview(dateLabel)
        cellBackgroundView.addSubview(descriptionLabel)
        cellBackgroundView.addSubview(priceView)
        priceView.addSubview(priceLabel)
        priceView.addSubview(starsView)
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

            productImageView.leftAnchor.constraint(
                equalTo: cellBackgroundView.leftAnchor,
                constant: Constants.borderOffset
            ),
            productImageView.topAnchor.constraint(
                equalTo: cellBackgroundView.topAnchor,
                constant: Constants.borderOffset
            ),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            productImageView.widthAnchor.constraint(equalToConstant: 60),

            nameView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: Constants.offsetToImage),
            nameView.topAnchor.constraint(equalTo: cellBackgroundView.topAnchor, constant: Constants.borderOffset),
            nameView.rightAnchor.constraint(equalTo: cellBackgroundView.rightAnchor, constant: -Constants.borderOffset),

            nameLabel.leftAnchor.constraint(equalTo: nameView.leftAnchor),
            nameLabel.topAnchor.constraint(equalTo: nameView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: nameView.bottomAnchor),

            dateLabel.leftAnchor.constraint(greaterThanOrEqualTo: nameLabel.rightAnchor),
            dateLabel.rightAnchor.constraint(equalTo: nameView.rightAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameView.topAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: nameView.bottomAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: nameView.bottomAnchor, constant: Constants.verticalOffset),
            descriptionLabel.leftAnchor.constraint(
                equalTo: productImageView.rightAnchor,
                constant: Constants.offsetToImage
            ),
            descriptionLabel.rightAnchor.constraint(
                equalTo: cellBackgroundView.rightAnchor,
                constant: -Constants.borderOffset
            ),

            priceView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.verticalOffset),
            priceView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: Constants.offsetToImage),
            priceView.bottomAnchor.constraint(
                equalTo: cellBackgroundView.bottomAnchor,
                constant: -Constants.borderOffset
            ),
            priceView.rightAnchor.constraint(equalTo: cellBackgroundView.rightAnchor, constant: Constants.borderOffset),
        ])
    }

    func setupBorder() {
        cellBackgroundView.layer.borderColor = UIColor.gray.cgColor
        cellBackgroundView.layer.borderWidth = 1
    }

    func getDateString(timestamp: Int) -> String {
        let date = Date(timeIntervalSince1970: TimeInterval(timestamp))

        let formatter = DateFormatter()
        formatter.dateFormat = "dd MMM yyyy"
        return formatter.string(from: date)
    }
}
