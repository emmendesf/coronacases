//
//  UITableView+Reusable.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//


import UIKit

extension UITableView {
    func dequeueReusableCell<T: UITableViewCell & Reusable>(for indexPath: IndexPath) -> T {
        guard let cell = dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.identifier)")
        }
        
        return cell
    }
    
    func register<T: UITableViewCell & Reusable>(_: T.Type = T.self) {
        register(T.self, forCellReuseIdentifier: T.identifier)
    }
}
