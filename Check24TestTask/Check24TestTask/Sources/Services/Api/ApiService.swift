//
//  ApiService.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol ApiServiceProtocol {

    func getProductList()
}

final class ApiService: ApiServiceProtocol {

    private let session = URLSession(configuration: URLSessionConfiguration.default)

    func getProductList() {
        let task = session.dataTask(with: URL(string: "http://app.check24.de/products-test.json")!) { data, response, error in
            print(data)
            print(response)
            print(error)
        }

        task.resume()
    }
}
