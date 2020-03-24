//  OnboardView.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright (c) 2020 Emerson Mendes Filho. All rights reserved.

import UIKit

class OnboardView: UIView {

    private let viewModel: OnboardViewModel

    init(viewModel: OnboardViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildView()
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = R.string.localizable.onboardTitle()
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textColor = .white
        return headerLabel
    }()
    
    private lazy var virusIcon: UIImageView = {
        let image = R.image.darkVirusImage()
        let imageView = UIImageView(image: image)
        imageView.setImageColor(color: CustomColors.shared.coronaLightGray)
        return imageView
    }()
        
    private lazy var onboardTitle: UILabel = {
        let onboardTitle = UILabel()
        onboardTitle.text = R.string.localizable.onboardSubtitle()
        onboardTitle.textColor = CustomColors.shared.salmon
        onboardTitle.font = UIFont.boldSystemFont(ofSize: 18)
        return onboardTitle
    }()
    
    private lazy var onboardText: UILabel = {
        let onboardLabel = UILabel()
        onboardLabel.text = R.string.localizable.onboardText()
        onboardLabel.textColor = .white
        onboardLabel.numberOfLines = 0
        onboardLabel.textAlignment = .center
        onboardLabel.font = UIFont.systemFont(ofSize: 16)
        return onboardLabel
    }()
    
    private lazy var getStartedButton: CoronaButton = {
         let title = R.string.localizable.onboardGetStartedButtonTitle()
         let button = CoronaButton(componentState: .clear,
                                   title: title,
                                   color: CustomColors.shared.salmon)
         button.setupButton()
         button.addTarget(self, action: #selector(tapGetStarted), for: .touchUpInside)
         return button
     }()

    
    @objc func tapGetStarted() {
        viewModel.showLocationPermissionScreen()
    }
}

extension OnboardView: ViewCodeProtocol {

    func setupHierarchy() {
        addSubview(headerLabel)
        addSubview(virusIcon)
        addSubview(onboardTitle)
        addSubview(onboardText)
        addSubview(getStartedButton)
    }

    func setupConstraints() {
        headerLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 50),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        onboardTitle.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        virusIcon.constraint { view in
            [view.bottomAnchor.constraint(equalTo: onboardTitle.topAnchor, constant: -10),
             view.centerXAnchor.constraint(equalTo: centerXAnchor),
             view.widthAnchor.constraint(equalToConstant: 160),
             view.heightAnchor.constraint(equalToConstant: 160)]
        }
        
        onboardText.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 62),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -62),
             view.topAnchor.constraint(equalTo: onboardTitle.bottomAnchor, constant: 15)]
        }
        
        getStartedButton.constraint { view in
             [view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),
              view.centerXAnchor.constraint(equalTo: centerXAnchor),
              view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
              view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
              view.heightAnchor.constraint(equalToConstant: 45)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = CustomColors.shared.coronaDarkGray
    }
}
