//
//  ListViewControllerPresenter.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol ListViewControllerPresenterProtocol: AnyObject {
    func onViewDidLoad()
    func onTableViewCellSelected(productID: Int)
    func onTapFilter(_ filter: FilterViewModel.Filter)
}

final class ListViewControllerPresenter: ListViewControllerPresenterProtocol {

    var interactor: ListViewControllerInteractorProtocol! // injected
    var router: ListViewControllerRouterProtocol! // injected

    private weak var view: ListViewControllerViewProtocol!
    private var model: ProductListModel?

    init(view: ListViewControllerViewProtocol) {
        self.view = view
    }

    func onViewDidLoad() {
        view.loadingState = .loading
        interactor.getList(onComplete: { [weak self] result in
            self?.view.loadingState = .loaded
            self?.handleGetListResult(result)
        })
    }

    func onTableViewCellSelected(productID: Int) {
        guard let product = model?.products.first(where: { $0.id == productID }) else { return }
        router.openProductScreen(product)
    }

    func onTapFilter(_ filter: FilterViewModel.Filter) {
        switch filter {
        case .all:
            guard let model = model else { return }
            createDataStorage(model: model)
        case .available:
            guard let model = model else { return }

            var modelCopy = model
            modelCopy.products = model.products.filter { $0.available }
            createDataStorage(model: modelCopy)
        case .favourite:
            break // cant figure out how detect favourite product
        case .other:
            break
        }
    }
}

// MARK: - Private
private extension ListViewControllerPresenter {
    func handleGetListResult(_ result: GetProductListResult) {
        switch result {
        case .success(let model):
            self.model = model
            createDataStorage(model: model)
            view.setupFilterView(
                with: FilterViewModel(
                    filters: model.filters.map {
                        FilterViewModel.Filter(rawValue: $0.rawValue) ?? .other
                    }
                )
            )
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
                        id: $0.id,
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
                        id: $0.id,
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
