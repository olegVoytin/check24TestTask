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

    private weak var view: DetailsViewControllerProtocol!
    var router: DetailsRouterProtocol! // injected

    init(view: DetailsViewControllerProtocol) {
        self.view = view
    }
}
