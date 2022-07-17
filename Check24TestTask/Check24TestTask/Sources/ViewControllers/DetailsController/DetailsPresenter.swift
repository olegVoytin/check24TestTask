//
//  DetailsPresenter.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol DetailsPresenterProtocol: AnyObject {

}

final class DetailsPresenter: DetailsPresenterProtocol {

    var router: DetailsRouterProtocol! // injected

    private weak var view: DetailsViewControllerProtocol!
    private let model: ProductListModel.Product

    init(view: DetailsViewControllerProtocol, model: ProductListModel.Product) {
        self.view = view
        self.model = model
    }
}
