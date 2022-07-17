//
//  AvailableProductCell.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class AvailableProductCell: UITableViewCell {

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

    private let dateLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        return label
    }()

    private let descriptionLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        return label
    }()

    private let priceLabel: UILabel = {
        let label = UILabel().prepareForAutolayout()
        return label
    }()

    private let starsView = UIView().prepareForAutolayout()
    private let nameView = UIView().prepareForAutolayout()
    private let priceView = UIView().prepareForAutolayout()

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

    func setup(with viewModel: AvailableProductCellViewModel) {
        
    }
}

private extension AvailableProductCell {

    func resetData() {
        productImageView.image = nil
        nameLabel.reset()
        descriptionLabel.reset()
        priceLabel.reset()
    }

    func setupView() {
        createHierarchy()
        setupConstraints()
    }

    func createHierarchy() {
        contentView.addSubview(productImageView)
        contentView.addSubview(nameView)
        nameView.addSubview(nameLabel)
        nameView.addSubview(dateLabel)
        contentView.addSubview(descriptionLabel)
        contentView.addSubview(priceView)
        priceView.addSubview(priceLabel)
        priceView.addSubview(starsView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            productImageView.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: Constants.borderOffset),
            productImageView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.borderOffset),
            productImageView.heightAnchor.constraint(equalToConstant: 60),
            productImageView.widthAnchor.constraint(equalToConstant: 60),

            nameView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: Constants.offsetToImage),
            nameView.topAnchor.constraint(equalTo: contentView.topAnchor, constant: Constants.borderOffset),
            nameView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -Constants.borderOffset),

            nameLabel.leftAnchor.constraint(equalTo: nameView.leftAnchor),
            nameLabel.topAnchor.constraint(equalTo: nameView.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: nameView.bottomAnchor),

            dateLabel.leftAnchor.constraint(equalTo: nameLabel.rightAnchor),
            dateLabel.rightAnchor.constraint(equalTo: nameView.rightAnchor),
            dateLabel.topAnchor.constraint(equalTo: nameView.topAnchor),
            dateLabel.bottomAnchor.constraint(equalTo: nameView.bottomAnchor),

            descriptionLabel.topAnchor.constraint(equalTo: nameView.topAnchor, constant: Constants.verticalOffset),
            descriptionLabel.leftAnchor.constraint(
                equalTo: productImageView.rightAnchor,
                constant: Constants.offsetToImage
            ),
            descriptionLabel.rightAnchor.constraint(
                equalTo: contentView.rightAnchor,
                constant: -Constants.borderOffset
            ),

            priceView.topAnchor.constraint(equalTo: descriptionLabel.bottomAnchor, constant: Constants.verticalOffset),
            priceView.leftAnchor.constraint(equalTo: productImageView.rightAnchor, constant: Constants.offsetToImage),
            priceView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -Constants.borderOffset),
            priceView.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: Constants.borderOffset),
        ])
    }
}
