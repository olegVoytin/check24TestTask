//
//  ListViewControllerInteractor.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol ListViewControllerInteractorProtocol: AnyObject {
    func getList(onComplete: @escaping (GetProductListResult) -> Void)
}

final class ListViewControllerInteractor: ListViewControllerInteractorProtocol {

    private weak var presenter: ListViewControllerPresenterProtocol!
    private let apiService: ApiServiceProtocol

    init(presenter: ListViewControllerPresenterProtocol, apiService: ApiServiceProtocol) {
        self.presenter = presenter
        self.apiService = apiService
    }

    func getList(onComplete: @escaping (GetProductListResult) -> Void) {
        apiService.getProductList(onComplete: onComplete)
    }
}
