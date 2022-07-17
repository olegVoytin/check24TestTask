//
//  ApiService.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

typealias GetProductListResult = Result<ProductListModel, Error>

protocol ApiServiceProtocol {
    func getProductList(onComplete: @escaping (GetProductListResult) -> Void)
}

final class ApiService: ApiServiceProtocol {

    private let session = URLSession(configuration: URLSessionConfiguration.default)

    func getProductList(onComplete: @escaping (GetProductListResult) -> Void) {
        guard let url = RestActions.getProductList.actionURL else { return }
        let task = session.dataTask(with: url) { data, _, error in
            if let error = error {
                DispatchQueue.main.async {
                    onComplete(.failure(error))
                }
                return
            }

            if let data = data {
                if let result: ProductListModel = data.decode() {
                    DispatchQueue.main.async {
                        onComplete(.success(result))
                    }
                } else {
                    // cannot decode
                }
            } else {
                // there is no data
            }
        }

        task.resume()
    }
}
