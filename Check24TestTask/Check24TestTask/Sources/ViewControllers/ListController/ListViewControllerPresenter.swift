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
            createDataStorage(model: model)
        case .failure(let error):
            break
        }
    }

    func createDataStorage(model: ProductListModel) {
        let rows = createRows(products: model.products)
        let dataStorage = TableViewDataStorage(
            sections: [
                TableViewSection(rows: rows)
            ]
        )

        view.update(dataStorage: dataStorage)
    }

    func createRows(products: [ProductListModel.Product]) -> [TableViewRow] {
        return products.map {
            if $0.available {
                return TableViewRow(
                    cellModel: AvailableProductCellModel(
                        viewModel: AvailableProductCellViewModel(
                            name: $0.name,
                            type: ProductType(rawValue: $0.type.rawValue) ?? .other,
                            id: $0.id,
                            imageURL: $0.imageURL,
                            colorCode: $0.colorCode,
                            releaseDate: $0.releaseDate,
                            description: $0.description,
                            rating: $0.rating,
                            price: AvailableProductCellViewModel.Price(
                                value: $0.price.value,
                                currency: AvailableProductCellViewModel.Price.Currency(
                                    rawValue: $0.price.currency.rawValue
                                ) ?? .other
                            )
                        )
                    )
                )
            } else {
                return TableViewRow(
                    cellModel: NonAvailableProductCellModel(
                        viewModel: NonAvailableProductCellViewModel(
                            name: $0.name,
                            type: ProductType(rawValue: $0.type.rawValue) ?? .other,
                            id: $0.id,
                            imageURL: $0.imageURL,
                            colorCode: $0.colorCode,
                            description: $0.description,
                            rating: $0.rating
                        )
                    )
                )
            }
        }
    }
}
