//
//  ListViewControllerConfigurator.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import Foundation

enum ListViewControllerConfigurator {
    static func make() -> ListViewController {
        let view = ListViewController()
        let presenter = ListViewControllerPresenter(view: view)
        let router = ListViewControllerRouter(view: view)
        let interactor = ListViewControllerInteractor(presenter: presenter)

        view.presenter = presenter
        presenter.interactor = interactor
        presenter.router = router

        return view
    }
}
