//
//  Listable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

protocol Listable {
    var numberOfSections: Int { get }
    var header: UIView { get }
    func numberOfRows(section: Int) -> Int
    func cell(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell
}
