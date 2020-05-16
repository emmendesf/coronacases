//
//  CovidCasesTableViewCell.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesTableViewCell: UITableViewCell, Reusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var leftContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 4
        
        return stackView
    }()
    
    private lazy var rightContentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var casesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var deathsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var countryInitialsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 40)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var casesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var deathsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var casesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    private lazy var deathsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textColor = .white
        
        return label
    }()
    
    func configure(countryInitials: String,
                   countryName: String,
                   numberOfCases: String,
                   numberOfDeaths: String) {
        countryInitialsLabel.text = countryInitials
        countryNameLabel.text = countryName
        casesLabel.text = numberOfCases
        deathsLabel.text = numberOfDeaths
        
    }
}

extension CovidCasesTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(rightContentStackView)
        contentStackView.addArrangedSubview(leftContentStackView)
        rightContentStackView.addArrangedSubview(countryInitialsLabel)
        rightContentStackView.addArrangedSubview(countryNameLabel)
        leftContentStackView.addArrangedSubview(casesStackView)
        leftContentStackView.addArrangedSubview(deathsStackView)
        casesStackView.addArrangedSubview(casesTitleLabel)
        casesStackView.addArrangedSubview(casesLabel)
        deathsStackView.addArrangedSubview(deathsTitleLabel)
        deathsStackView.addArrangedSubview(deathsLabel)
    }
    
    func setupConstraints() {
        contentStackView.constraint { view in
            [view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
             view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             view.topAnchor.constraint(equalTo: contentView.topAnchor)]
        }
    }
}
