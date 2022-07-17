//
//  Data+Extensions.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

extension Data {
    func decode<ResponseData: Decodable>(decoder: JSONDecoder = JSONDecoder()) -> ResponseData? {
        do {
            return try decoder.decode(ResponseData.self, from: self)
        } catch {
            return nil
        }
    }
}
