//
//  FilterViewModel.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

struct FilterViewModel {
    let filters: [Filter]

    enum Filter: String {
        case all = "Alle"
        case available = "Verfügbar"
        case favourite = "Vorgemerkt"
        case other
    }
}
