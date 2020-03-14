//
//  Coordinator.swift
//  CoronaCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import UIKit

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
