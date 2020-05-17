//
//  CovidCasesTableViewCell.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 29/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesTableViewCell: UITableViewCell, CellReusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var contentStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 8
        
        return stackView
    }()
    
    private lazy var casesStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var deathsStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.spacing = 16
        
        return stackView
    }()
    
    private lazy var countryNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 25)
        label.textColor = CustomColors.shared.salmon
        
        return label
    }()
    
    private lazy var casesTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.text = R.string.localizable.covidCasesCellCasesTitle()
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private lazy var deathsTitleLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = .white
        label.text = R.string.localizable.covidCasesCellDeathsTitle()
        label.setContentHuggingPriority(.required, for: .horizontal)
        
        return label
    }()
    
    private lazy var casesLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = CustomColors.shared.lightRed
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var deathsLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = CustomColors.shared.lightRed
        label.textAlignment = .left
        
        return label
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.shared.separatorGray
        
        return view
    }()
}

extension CovidCasesTableViewCell: CellConfigurable {
    func configure(with model: CountryFormatterProtocol) {
        countryNameLabel.text = model.countryName
        casesLabel.text = model.casesFormatted
        deathsLabel.text = model.deathsFormatted
        contentView.backgroundColor = model.isFeatured ?
            CustomColors.shared.darkRed :
            CustomColors.shared.coronaDarkGray
    }
}

extension CovidCasesTableViewCell: ViewCodeProtocol {
    func setupHierarchy() {
        contentView.addSubview(contentStackView)
        contentStackView.addArrangedSubview(countryNameLabel)
        contentStackView.addArrangedSubview(casesStackView)
        contentStackView.addArrangedSubview(deathsStackView)
        casesStackView.addArrangedSubview(casesTitleLabel)
        casesStackView.addArrangedSubview(casesLabel)
        deathsStackView.addArrangedSubview(deathsTitleLabel)
        deathsStackView.addArrangedSubview(deathsLabel)
        
        contentView.addSubview(separatorView)
    }
    
    func setupConstraints() {
        contentStackView.constraint { view in
            [view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 16),
             view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -16),
             view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -16),
             view.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 16)]
        }
        
        deathsTitleLabel.constraint { view in
            [view.widthAnchor.constraint(equalTo: casesTitleLabel.widthAnchor)]
        }
        
        separatorView.constraint { view in
            [view.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
             view.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
             view.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
             view.heightAnchor.constraint(equalToConstant: 1)]
        }
    }
}
