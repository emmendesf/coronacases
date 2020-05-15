//
//  AboutViewController.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class AboutViewController: UIViewController {

    private let contentView: AboutView
    private let viewModel: AboutViewModel

    init(viewModel: AboutViewModel) {
        self.viewModel = viewModel
        self.contentView = AboutView(viewModel: viewModel)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func loadView() {
        view = contentView
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    func setupNavigation() {
        navigationController?.isNavigationBarHidden = false
    }
}
