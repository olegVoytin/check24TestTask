//
//  ViewController.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

protocol ListViewControllerViewProtocol: AnyObject {

}

final class ListViewController: UIViewController, ListViewControllerViewProtocol {

    var presenter: ListViewControllerPresenterProtocol! // injected

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
    }

}

