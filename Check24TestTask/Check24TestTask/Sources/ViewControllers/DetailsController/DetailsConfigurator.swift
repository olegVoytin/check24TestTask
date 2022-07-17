//
//  DetailsConfigurator.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

enum DetailsConfigurator {
    static func make(with model: ProductListModel.Product) -> DetailsViewController {
        let view = DetailsViewController()
        let presenter = DetailsPresenter(view: view, model: model)
        let router = DetailsRouter(view: view)

        view.presenter = presenter
        presenter.router = router

        return view
    }
}
