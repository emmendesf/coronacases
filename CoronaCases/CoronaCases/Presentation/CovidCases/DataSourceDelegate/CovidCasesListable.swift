//
//  CovidCasesListable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesListable: TableViewListable {
    enum Section: Int, CaseIterable {
        case featured = 0
        case standard
    }
    
    private let countryList: CountryListFormatter
    
    init(countryList: CountryListFormatter) {
        self.countryList = countryList
    }
    
    var numberOfSections: Int {
        return Section.allCases.count
    }
    
    func header(for section: Int) -> UIView? {
        guard let section = Section(rawValue: section) else {
            return nil
        }
        
        let headerType = CovidCasesHeaderType(sectionType: section)
        return CovidCasesHeaderView(type: headerType)
    }
    
    func numberOfRows(section: Int) -> Int {
        guard let section = Section(rawValue: section) else {
            return 0
        }
        
        return countryList.numberOfRows(for: section)
    }
    
    func cell(for indexPath: IndexPath, in tableView: UITableView) -> UITableViewCell {
        guard let section = Section(rawValue: indexPath.section) else {
            return UITableViewCell()
        }
        
        let cell: CovidCasesTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        let country = countryList.country(for: indexPath.row, in: section)
        cell.configure(with: country)
        
        return cell
    }
}
