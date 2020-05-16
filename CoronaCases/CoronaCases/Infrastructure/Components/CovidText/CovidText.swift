//
//  CovidText.swift
//  CovidCases
//
//  Created by Caio Roberto on 15/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CovidText: UIView {
    
    private let title: String
    private let text: String
    
    init(title: String, text: String) {
        self.title = title
        self.text = text
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var titleLabel: TitleLabel = {
        return TitleLabel(text: title)
    }()
    
    private lazy var textLabel: DescriptiveLabel = {
        return DescriptiveLabel(text: text)
    }()

}

extension CovidText: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(titleLabel)
        addSubview(textLabel)
    }

    func setupConstraints() {
        titleLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor),
             view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor)]
        }

        textLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)]
        }
    }
}
