//
//  ListViewControllerPresenter.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol ListViewControllerPresenterProtocol: AnyObject {
    func onViewDidLoad()
}

final class ListViewControllerPresenter: ListViewControllerPresenterProtocol {

    private weak var view: ListViewControllerViewProtocol!
    var interactor: ListViewControllerInteractorProtocol! // injected
    var router: ListViewControllerRouterProtocol! // injected

    init(view: ListViewControllerViewProtocol) {
        self.view = view
    }

    func onViewDidLoad() {
        interactor.getList(onComplete: { [weak self] result in
            self?.handleGetListResult(result)
        })
    }
}

// MARK: - Private
private extension ListViewControllerPresenter {
    func handleGetListResult(_ result: GetProductListResult) {
        switch result {
        case .success(let model):
            print(model)
        case .failure(let error):
            break
        }
    }
}
