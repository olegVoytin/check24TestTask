//
//  LaunchViewController.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

final class LaunchViewController: UIViewController {

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        showListController()
    }

    private func showListController() {
        let listController = ListViewControllerConfigurator.make(apiService: ServicesLocator.apiService)
        listController.modalPresentationStyle = .fullScreen
        self.present(listController, animated: false, completion: nil)
    }
}
