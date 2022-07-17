//
//  AvailableProductCellModel.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

struct AvailableProductCellModel: TableViewCellModelProtocol {
    let viewModel: AvailableProductCellViewModel

    func createCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: AvailableProductCell.reuseIdentifier,
            for: indexPath
        ) as? AvailableProductCell else { return UITableViewCell() }
        cell.setup(with: viewModel)
        return cell
    }
}
