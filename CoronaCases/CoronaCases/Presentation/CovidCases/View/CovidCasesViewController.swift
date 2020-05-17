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
        presenter.requestStatistics()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupNavigation()
    }

    func setupNavigation() {
        title = R.string.localizable.covidCasesTitle()
        navigationItem.searchController = buildSearchController()
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationController?.isNavigationBarHidden = false
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationBar.barTintColor = CustomColors.shared.coronaDarkGray
        navigationController?.navigationBar.tintColor = .white
        let textAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white]
        navigationController?.navigationBar.titleTextAttributes = textAttributes
        navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor: UIColor.white];
    }
    
    private func buildSearchController() -> UISearchController {
        let search = UISearchController(searchResultsController: nil)
        search.searchResultsUpdater = self
        search.obscuresBackgroundDuringPresentation = false
        search.searchBar.placeholder = "Type something here to search"
        
        return search
    }
}

extension CovidCasesViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        presenter.search(text: searchController.searchBar.text)
    }
}
