//
//  DetailsViewController.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

protocol DetailsViewControllerProtocol: AnyObject {

}

final class DetailsViewController: UIViewController, DetailsViewControllerProtocol {

    var presenter: DetailsPresenterProtocol! // injected

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
