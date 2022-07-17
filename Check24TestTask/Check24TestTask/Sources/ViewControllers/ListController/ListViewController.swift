//
//  ViewController.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

enum LoadingState {
    case loading
    case loaded
}

protocol ListViewControllerViewProtocol: AnyObject {
    var loadingState: LoadingState { get set }

    func update(dataStorage: TableViewDataStorage)
}

final class ListViewController: UIViewController, ListViewControllerViewProtocol {

    var loadingState: LoadingState = .loading {
        didSet {
            switch loadingState {
            case .loading:
                loadingView.isHidden = false
                loadingView.startAnimating()
            case .loaded:
                loadingView.isHidden = true
                loadingView.stopAnimating()
            }
        }
    }

    private var dataStorage = TableViewDataStorage.empty {
        didSet {
            tableView.reloadData()
        }
    }

    private let backgroundView: UIView = {
        let view = UIView().prepareForAutolayout()
        view.backgroundColor = .blue
        return view
    }()
    private let filterView = FilterView().prepareForAutolayout()
    private let loadingView = UIActivityIndicatorView().prepareForAutolayout()

    private lazy var tableView: UITableView = {
        let table = UITableView().prepareForAutolayout()
        table.dataSource = self
        table.delegate = self
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
        title = "Check24TestTask"
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

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        defer { tableView.deselectRow(at: indexPath, animated: true) }
        let id = dataStorage.didSelectRowAt(indexPath: indexPath).id
        presenter.onTableViewCellSelected(productID: id)
    }
}

// MARK: - Private
private extension ListViewController {
    func createHierarchy() {
        view.addSubview(backgroundView)
        backgroundView.addSubview(filterView)
        backgroundView.addSubview(tableView)
        backgroundView.addSubview(loadingView)
    }

    func setupConstraints() {
        NSLayoutConstraint.activate([
            backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
            backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            backgroundView.leftAnchor.constraint(equalTo: view.leftAnchor),
            backgroundView.rightAnchor.constraint(equalTo: view.rightAnchor),

            filterView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            filterView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            filterView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),

            tableView.topAnchor.constraint(equalTo: filterView.bottomAnchor),
            tableView.leftAnchor.constraint(equalTo: backgroundView.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: backgroundView.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: backgroundView.safeAreaLayoutGuide.bottomAnchor),

            loadingView.topAnchor.constraint(equalTo: view.topAnchor),
            loadingView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            loadingView.leftAnchor.constraint(equalTo: view.leftAnchor),
            loadingView.rightAnchor.constraint(equalTo: view.rightAnchor),
        ])
    }
}
