//
//  ListViewControllerInteractor.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

protocol ListViewControllerInteractorProtocol: AnyObject {

}

final class ListViewControllerInteractor: ListViewControllerInteractorProtocol {

    private weak var presenter: ListViewControllerPresenterProtocol!

    init(presenter: ListViewControllerPresenterProtocol) {
        self.presenter = presenter
    }
}
