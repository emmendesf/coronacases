//
//  Coordinator.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

protocol Coordinator: class {
    var nextCoordinator: Coordinator? { get set}
    var currentViewController: UIViewController? { get }
    func start()
    func start(animated: Bool)
}

extension Coordinator {
    func start() {
        start(animated: true)
    }
}
