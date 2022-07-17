//
//  AvailableProductCellViewModel.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

struct AvailableProductCellViewModel {
    let name: String
    let type: `Type`
    let id: Int
    let imageURL: String
    let colorCode: String
    let releaseDate: Int
    let description: String
    let rating: Float
    let price: Price

    enum `Type`: String {
        case triangle = "Triangle"
        case circle = "Circle"
        case square = "Square"
        case hexagon = "Hexagon"
        case other
    }

    struct Price {
        let value: Float
        let currency: Currency

        enum Currency: String {
            case eur = "EUR"
            case other
        }
    }
}
