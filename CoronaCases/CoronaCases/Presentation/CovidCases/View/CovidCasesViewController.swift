//
//  CovidCasesViewController.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class CovidCasesViewController: UIViewController {

    private let contentView: CovidCasesView
    private let presenter: CovidCasesPresenterContract

    init(presenter: CovidCasesPresenterContract) {
        self.presenter = presenter
        self.contentView = CovidCasesView(presenter: presenter)
        super.init(nibName: nil, bundle: nil)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        view = contentView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigation()
        presenter.requestStatistics()
    }

    func setupNavigation() {
        navigationItem.searchController = buildSearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.navigationBar.isTranslucent = false
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.shadowImage = UIImage()
        navigationController?.navigationBar.barTintColor = CustomColors.shared.darkRed
    }
    
    private func buildSearchController() -> UISearchController {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.searchBar.tintColor = CustomColors.shared.coronaLightGray
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = R.string.localizable.covidCasesSearchBarPlaceholder()
        search.searchBar.barTintColor = CustomColors.shared.coronaLightGray
        search.configureSearchBarForMainScreen()

        return search
    }
}

extension CovidCasesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.search(text: searchController.searchBar.text)
    }
}
