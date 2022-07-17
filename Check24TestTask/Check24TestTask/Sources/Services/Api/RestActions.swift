//
//  RestActions.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

enum RestActions {

    case getProductList

    var actionURL: URL? {
        switch self {
        case .getProductList:
            return URL(string: RestActions.domain + "products-test.json")
        }
    }
}

fileprivate extension RestActions {
    private static let domain = "http://app.check24.de/"
}
