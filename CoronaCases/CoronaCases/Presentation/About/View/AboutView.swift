//
//  AboutView.swift
//  CovidCases
//
//  Created by Caio Roberto on 11/05/20.
//  Copyright (c) 2020 A7&M. All rights reserved.
//

import UIKit

class AboutView: UIView {

    private let viewModel: AboutViewModel

    init(viewModel: AboutViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        self.viewModel.viewDelegate = self
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var headerLabel: HeaderLabel = {
        let text = R.string.localizable.aboutTitle()
        
        return HeaderLabel(text: text)
    }()
    
    private lazy var firstText: CovidText = {
        return CovidText(title: R.string.localizable.aboutFirstSubtitle(),
                         text: R.string.localizable.aboutFirstText())
    }()
    
    private lazy var secondText: CovidText = {
        return CovidText(title: R.string.localizable.aboutSecondSubtitle(),
                         text: R.string.localizable.aboutSecondText())
    }()
    
    private lazy var footerLabel: DescriptiveLabel = {
        let versionNumber = viewModel.versionNumber()
        let text = R.string.localizable.aboutFooterText(versionNumber)
        let label = DescriptiveLabel(text: text)
        label.font = UIFont.systemFont(ofSize: 14)
        
        return label
    }()
    
    private lazy var containerStackView: UIStackView = {
        let view = UIStackView()
        view.distribution = .fillEqually
        view.axis = .vertical
        view.spacing = 80
        
        return view
    }()
}

extension AboutView: AboutViewModelViewDelegate {

}

extension AboutView: ViewCodeProtocol {

    func setupHierarchy() {
        addSubview(headerLabel)
        addSubview(footerLabel)
        addSubview(containerStackView)
        containerStackView.addArrangedSubview(firstText)
        containerStackView.addArrangedSubview(secondText)
    }

    func setupConstraints() {
        headerLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 50),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        footerLabel.constraint { view in
            [view.bottomAnchor.constraint(equalTo: safeArea().bottomAnchor, constant: -30),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        containerStackView.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor),
             view.trailingAnchor.constraint(equalTo: trailingAnchor),
             view.centerYAnchor.constraint(equalTo: centerYAnchor)]
        }
        
        firstText.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 120),
             view.widthAnchor.constraint(equalToConstant: 300)]
        }
        
        secondText.constraint { view in
            [view.heightAnchor.constraint(equalToConstant: 120),
             view.widthAnchor.constraint(equalToConstant: 300)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = CustomColors.shared.coronaDarkGray
    }
}
