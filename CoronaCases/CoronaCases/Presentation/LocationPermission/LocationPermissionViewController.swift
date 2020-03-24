//
//  LocationPermissionViewController.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class LocationPermissionViewController: UIViewController {
    
    private let contentView: LocationPermissionView
    private let viewModel: LocationPermissionViewModel

    init(viewModel: LocationPermissionViewModel) {
        self.viewModel = viewModel
        self.contentView = LocationPermissionView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func loadView() {
        view = contentView
    }

    let service = CovidCasesService()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.isNavigationBarHidden = true
    }
}

