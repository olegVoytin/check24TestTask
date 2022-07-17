//
//  UnknownCaseRepresentable.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol UnknownCaseRepresentable: RawRepresentable, CaseIterable where RawValue: Equatable {
    static var unknownCase: Self { get }
}

extension UnknownCaseRepresentable {
    public init(rawValue: RawValue) {
        let value = Self.allCases.first(where: { $0.rawValue == rawValue })
        self = value ?? Self.unknownCase
    }
}
