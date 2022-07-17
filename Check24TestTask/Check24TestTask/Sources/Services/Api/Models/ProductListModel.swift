//
//  ProductListModel.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

struct ProductListModel: Decodable {
    let header: Header
    let filters: [Filter]
    let products: [Product]

    struct Header: Decodable {
        let headerTitle: String
        let headerDescription: String
    }

    enum Filter: String, Decodable, UnknownCaseRepresentable {
        case all = "Alle"
        case available = "Verfügbar"
        case favourite = "Vorgemerkt"
        case other

        static let unknownCase: ProductListModel.Filter = .other
    }

    struct Product: Decodable {
        let name: String
        let type: `Type`
        let id: Int
        let color: Color
        let imageURL: String
        let colorCode: String
        let available: Bool
        let releaseDate: Int
        let description: String
        let longDescription: String
        let rating: Float
        let price: Price

        enum `Type`: String, Decodable, UnknownCaseRepresentable {
            case triangle = "Triangle"
            case circle = "Circle"
            case square = "Square"
            case hexagon = "Hexagon"
            case other

            static let unknownCase: ProductListModel.Product.`Type` = .other
        }

        enum Color: String, Decodable, UnknownCaseRepresentable {
            case yellow = "Yellow"
            case blue = "Blue"
            case green = "Green"
            case red = "Red"
            case other

            static let unknownCase: ProductListModel.Product.Color = .other
        }

        struct Price: Decodable {
            let value: Float
            let currency: Currency

            enum Currency: String, Decodable, UnknownCaseRepresentable {
                case eur = "EUR"
                case other

                static let unknownCase: ProductListModel.Product.Price.Currency = .other
            }
        }
    }
}
