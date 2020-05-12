//
//  PreventionTipsViewController.swift
//  CovidCases
//
//  Created by Caio Roberto on 26/04/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class PreventionTipsViewController: UIViewController {

    var pageViewController: UIPageViewController?
    private let viewModel: PreventionTipsViewModel
    private let contentView: PreventionTipsView

    init(viewModel: PreventionTipsViewModel) {
        self.contentView = PreventionTipsView(viewModel: viewModel)
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
        self.view = contentView
        setupPageController()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupPageController() {
        self.pageViewController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        self.pageViewController?.delegate = contentView
        self.pageViewController?.dataSource = contentView
        self.pageViewController?.view.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height)
        self.addChild(self.pageViewController!)
        self.view.addSubview(self.pageViewController!.view)
        self.pageViewController?.setViewControllers([viewModel.pages[0]], direction: .forward, animated: false)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }
    
    func setupNavigation() {
        navigationController?.isNavigationBarHidden = true
    }
}
