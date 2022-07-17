//
//  ReusableView.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

public protocol ReusableView {
    static var reuseIdentifier: String { get }
}

public extension ReusableView {

    static var reuseIdentifier: String {
        String(describing: self)
    }
}
