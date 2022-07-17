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
        let controller = UINavigationController(
            rootViewController: ListViewControllerConfigurator.make(apiService: ServicesLocator.apiService)
        ) 
        controller.modalPresentationStyle = .fullScreen
        self.present(controller, animated: false, completion: nil)
    }
}
