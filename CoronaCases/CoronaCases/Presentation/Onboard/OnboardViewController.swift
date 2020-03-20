//  OnboardViewController.swift
//  CoronaCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 Emerson Mendes Filho. All rights reserved.

import UIKit

class OnboardViewController: UIViewController {

    private let contentView: OnboardView
    private let viewModel: OnboardViewModel

    init(viewModel: OnboardViewModel) {
        self.viewModel = viewModel
        self.contentView = OnboardView(viewModel: viewModel)
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
