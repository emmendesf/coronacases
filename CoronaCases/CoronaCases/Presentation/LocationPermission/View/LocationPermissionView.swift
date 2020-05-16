//
//  LocationPermissionView.swift
//  CovidCases
//
//  Created by Caio Roberto on 14/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class LocationPermissionView: UIView {
    
    private let viewModel: LocationPermissionViewModel
    
    init(viewModel: LocationPermissionViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var headerLabel: HeaderLabel = {
        let text = R.string.localizable.locationPermissionTitle()

        return HeaderLabel(text: text)
    }()
    
    private lazy var locationIcon: UIImageView = {
        let image = R.image.whiteLocationArrowImage()
        let imageView = UIImageView(image: image)
        imageView.setImageColor(color: CustomColors.shared.coronaLightGray)
        return imageView
    }()
        
    private lazy var askPermissionTitle: TitleLabel = {
        let text = R.string.localizable.locationPermissionSubtitle()

        return TitleLabel(text: text)
    }()
    
    private lazy var askPermissionLabel: DescriptiveLabel = {
        let text = R.string.localizable.locationPermissionText()
        
        return DescriptiveLabel(text: text)
    }()
    
    private lazy var leftButton: CoronaButton = {
        let title = R.string.localizable.locationPermissionSkipButtonTitle()
        let button = CoronaButton(componentState: .clear,
                                  title: title,
                                  color: CustomColors.shared.salmon)
        button.setupButton()
        button.addTarget(self, action: #selector(openNextScreen), for: .touchUpInside)
        return button
    }()
    
    private lazy var rightButton: CoronaButton = {
        let title = R.string.localizable.locationPermissionAllowButtonTitle()
        let button = CoronaButton(componentState: .filled,
                                  title: title,
                                  color: CustomColors.shared.salmon)
        button.setupButton()
        button.addTarget(self, action: #selector(askForLocationPermission), for: .touchUpInside)
        return button
    }()

    @objc private func askForLocationPermission() {
        viewModel.askForLocationAccessPermission()
    }
    
    @objc private func openNextScreen() {
        viewModel.openNextScreenWithoutLocation()
    }
}

extension LocationPermissionView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(headerLabel)
        addSubview(locationIcon)
        addSubview(askPermissionTitle)
        addSubview(askPermissionLabel)
        addSubview(leftButton)
        addSubview(rightButton)
    }
    
    func setupConstraints() {

        headerLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor, constant: 50),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        askPermissionTitle.constraint { view in
            [view.centerYAnchor.constraint(equalTo: centerYAnchor),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }
        
        locationIcon.constraint { view in
            [view.bottomAnchor.constraint(equalTo: askPermissionTitle.topAnchor, constant: -10),
             view.centerXAnchor.constraint(equalTo: centerXAnchor),
             view.widthAnchor.constraint(equalToConstant: 107.2),
             view.heightAnchor.constraint(equalToConstant: 107.2)]
        }
        
        askPermissionLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 50),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -50),
             view.topAnchor.constraint(equalTo: askPermissionTitle.bottomAnchor, constant: 15)]
        }

        leftButton.constraint { view in
            [view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -42),
             view.trailingAnchor.constraint(equalTo: centerXAnchor, constant: -15),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             view.heightAnchor.constraint(equalToConstant: 45)]
        }

        rightButton.constraint { view in
             [view.centerYAnchor.constraint(equalTo: leftButton.centerYAnchor),
              view.leadingAnchor.constraint(equalTo: centerXAnchor, constant: 15),
              view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
              view.heightAnchor.constraint(equalToConstant: 45)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = CustomColors.shared.coronaDarkGray
    }
}
