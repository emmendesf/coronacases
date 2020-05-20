//
//  CovidCasesView.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesView: UIView {
    
    private var presenter: CovidCasesPresenterContract
    private var dataSourceDelegate: CovidCasesDataSourceDelegate?
    
    init(presenter: CovidCasesPresenterContract) {
        self.presenter = presenter
        super.init(frame: .zero)
        self.presenter.view = self
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .plain)
        
        tableView.sectionHeaderHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 44
        tableView.estimatedSectionHeaderHeight = 0
        tableView.sectionFooterHeight = UITableView.automaticDimension
        tableView.estimatedSectionFooterHeight = 0
        tableView.backgroundColor = CustomColors.shared.coronaDarkGray
        tableView.separatorStyle = .none
        tableView.separatorColor = .clear
        
        tableView.register(CovidCasesTableViewCell.self)
        
        return tableView
    }()
    
    private lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = CustomColors.shared.salmon
        
        return activityIndicator
    }()
    
    private lazy var errorLabel: UILabel = {
        let label = UILabel()
        label.text = R.string.localizable.covidCasesTitle()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    private func handleLoadingState() {
        tableView.isHidden = true
        errorLabel.isHidden = true
        activityIndicator.startAnimating()
    }
    
    private func handleLoadedState(with listable: TableViewListable) {
        tableView.isHidden = false
        errorLabel.isHidden = true
        activityIndicator.stopAnimating()
        setupDataSource(with: listable)
    }
    
    private func hadleErrorState() {
        tableView.isHidden = true
        errorLabel.isHidden = false
        activityIndicator.stopAnimating()
    }
    
    private func setupDataSource(with listable: TableViewListable) {
        dataSourceDelegate = CovidCasesDataSourceDelegate(
            listable: listable,
            tableView: tableView
        )
        
        tableView.reloadData()
    }
}

extension CovidCasesView: CovidCasesViewContract {
    func updateView(state: CovidCasesViewState) {
        switch state {
        case .loading:
            handleLoadingState()
        case let .loaded(countryList):
            let listable = CovidCasesListable(countryList: countryList)
            handleLoadedState(with: listable)
        case let .searched(countries):
            let listable = CovidCasesSearchListable(countries: countries)
            handleLoadedState(with: listable)
        case .error:
            hadleErrorState()

        }
    }
}

extension CovidCasesView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(tableView)
        addSubview(activityIndicator)
        addSubview(errorLabel)
    }
    
    func setupConstraints() {
        tableView.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.bottomAnchor.constraint(equalTo: bottomAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.topAnchor.constraint(equalTo: topAnchor)]
        }
        
        activityIndicator.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        errorLabel.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = CustomColors.shared.coronaDarkGray
    }
}
