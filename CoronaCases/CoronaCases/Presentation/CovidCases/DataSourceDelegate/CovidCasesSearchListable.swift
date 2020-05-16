//
//  CovidCasesSearchListable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesSearchListable: TableViewListable {
    private let countries: [CountryFormatter]

    init(countries: [CountryFormatter]) {
        self.countries = countries
    }

    var numberOfSections: Int = 1
    
    func header(for section: Int) -> UIView? {
        return nil
    }
    
    func numberOfRows(section: Int) -> Int {
        return 1
    }
    
    func cell(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        let cell: CovidCasesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.configure(with: countries[indexPath.row])
        
        return cell
    }
}
