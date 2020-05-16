//
//  CovidCasesListable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesListable: Listable {
    var numberOfSections: Int = 1
    
    var header: UIView {
        return UIView()
    }
    
    func numberOfRows(section: Int) -> Int {
        return 1
    }
    
    func cell(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        return UITableViewCell()
    }
}
