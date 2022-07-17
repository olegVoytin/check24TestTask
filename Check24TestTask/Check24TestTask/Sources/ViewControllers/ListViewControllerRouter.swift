//
//  ListViewControllerRouter.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

protocol ListViewControllerRouterProtocol: AnyObject {

}

final class ListViewControllerRouter: ListViewControllerRouterProtocol {
    private weak var view: UIViewController?

    init(view: UIViewController) {
        self.view = view
    }
}
