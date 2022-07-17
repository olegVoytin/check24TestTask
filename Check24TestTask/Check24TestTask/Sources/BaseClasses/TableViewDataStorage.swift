//
//  TableViewDataStorage.swift
//  Check24TestTask
//
//  Created by Олег Войтин on 17.07.2022.
//

import UIKit

protocol TableViewCellModelProtocol {
    func createCell(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}

struct TableViewDataStorage {
    let sections: [TableViewSection]

    static let empty = Self.init(sections: [])

    subscript(indexPath: IndexPath) -> TableViewCellModelProtocol {
        sections[indexPath.section].rows[indexPath.row].cellModel
    }

    func numberOfSections() -> Int {
        sections.count
    }

    func numberOfRowsInSection(_ section: Int) -> Int {
        sections[section].rows.count
    }

    func cellForRowAt(indexPath: IndexPath, tableView: UITableView) -> UITableViewCell {
        self[indexPath].createCell(tableView, indexPath: indexPath)
    }

    func didSelectRowAt(indexPath: IndexPath) -> TableViewCellModelProtocol {
        self[indexPath]
    }
}

struct TableViewSection {
    let rows: [TableViewRow]
}

struct TableViewRow {
    let cellModel: TableViewCellModelProtocol
}
