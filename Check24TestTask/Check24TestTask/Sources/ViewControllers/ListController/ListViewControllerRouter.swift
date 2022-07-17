//
//  ListViewControllerRouter.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

protocol ListViewControllerRouterProtocol: AnyObject {
    func openProductScreen(_ product: ProductListModel.Product)
}

final class ListViewControllerRouter: ListViewControllerRouterProtocol {
    
    private weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }

    func openProductScreen(_ product: ProductListModel.Product) {
        let viewController = DetailsConfigurator.make(with: product)
        view?.navigationController?.pushViewController(viewController, animated: true)
    }
}
