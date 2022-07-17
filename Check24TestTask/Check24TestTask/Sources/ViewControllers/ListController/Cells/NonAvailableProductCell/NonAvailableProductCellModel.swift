//
//  NonAvailableProductCellModel.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

struct NonAvailableProductCellModel: TableViewCellModelProtocol {
    var id: Int
    let viewModel: NonAvailableProductCellViewModel

    func createCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: NonAvailableProductCell.reuseIdentifier,
            for: indexPath
        ) as? NonAvailableProductCell else { return UITableViewCell() }
        cell.setup(with: viewModel)
        return cell
    }
}
