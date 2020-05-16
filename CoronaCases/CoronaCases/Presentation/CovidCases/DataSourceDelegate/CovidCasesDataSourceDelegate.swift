//
//  CovidCasesDataSourceDelegate.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesDataSourceDelegate: NSObject {
    private var listable: Listable
    private let tableView: UITableView
    
    init(listable: Listable,
         tableView: UITableView) {
        self.listable = listable
        self.tableView = tableView
        
        super.init()

        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension CovidCasesDataSourceDelegate: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return listable.numberOfSections
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listable.numberOfRows(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return listable.cell(for: indexPath, in: tableView)
    }
}

extension CovidCasesDataSourceDelegate: UITableViewDelegate {
    
}
