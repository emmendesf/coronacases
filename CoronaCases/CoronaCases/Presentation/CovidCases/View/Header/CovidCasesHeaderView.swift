//
//  CovidCasesHeaderView.swift
//  CovidCases
//
//  Created by Emerson Mendes Filho on 16/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidCasesHeaderView: UIView {
    private let style: CovidCasesHeaderStyle
    
    init(type: CovidCasesHeaderType) {
        self.style = type.style
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.text = style.title
        label.font = UIFont.systemFont(ofSize: 34)
        label.textColor = style.titleColor
        
        return label
    }()
}

extension CovidCasesHeaderView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(titleLabel)
    }
    
    func setupConstraints() {
        titleLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
             view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
             view.topAnchor.constraint(equalTo: topAnchor, constant: 24)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = style.backgroundColor
    }
}
