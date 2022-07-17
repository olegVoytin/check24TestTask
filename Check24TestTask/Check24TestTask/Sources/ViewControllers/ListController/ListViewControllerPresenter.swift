//
//  ListViewControllerPresenter.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol ListViewControllerPresenterProtocol: AnyObject {

}

final class ListViewControllerPresenter: ListViewControllerPresenterProtocol {

    private weak var view: ListViewControllerViewProtocol!
    var interactor: ListViewControllerInteractorProtocol! // injected
    var router: ListViewControllerRouterProtocol! // injected

    init(view: ListViewControllerViewProtocol) {
        self.view = view
    }
}
