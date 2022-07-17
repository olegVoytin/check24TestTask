//
//  ViewController.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

protocol ListViewControllerViewProtocol: AnyObject {
    func update(dataStorage: TableViewDataStorage)
}

final class ListViewController: UIViewController, ListViewControllerViewProtocol {

    private var dataStorage = TableViewDataStorage.empty {
        didSet {
            tableView.reloadData()
        }
    }

    private let backgroundView = UIView().prepareForAutolayout()
    private let titleView = TitleView().prepareForAutolayout()
    private let filterView = FilterView().prepareForAutolayout()

    private lazy var tableView: UITableView = {
        let table = UITableView().prepareForAutolayout()
        table.dataSource = self
        table.separatorStyle = .none
        table.register(AvailableProductCell.self, forCellReuseIdentifier: AvailableProductCell.reuseIdentifier)
        table.register(NonAvailableProductCell.self, forCellReuseIdentifier: NonAvailableProductCell.reuseIdentifier)
        return table
    }()

    var presenter: ListViewControllerPresenterProtocol! // injected

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.onViewDidLoad()
        createHierarchy()
        setupConstraints()
    }

    func update(dataStorage: TableViewDataStorage) {
        self.dataStorage = dataStorage
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        dataStorage.numberOfSections()
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        dataStorage.numberOfRowsInSection(section)
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        dataStorage.cellForRowAt(indexPath: indexPath, tableView: tableView)
    }
}

// MARK: - Private
private extension ListViewController {
    func createHierarchy() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(titleView)
        backgroundView.addSubview(filterView)
        backgroundView.addSubview(tableView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),

            titleView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            titleView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            titleView.topAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.topAnchor),

            filterView.topAnchor.constraint(equalTo: titleView.bottomAnchor),
            filterView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            filterView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),

            tableView.topAnchor.constraint(equalTo: filterView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.bottomAnchor),
        ])
    }
}
