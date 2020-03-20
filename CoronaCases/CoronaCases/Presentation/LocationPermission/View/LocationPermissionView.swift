//
//  LocationPermissionView.swift
//  CoronaCases
//
//  Created by Caio Roberto on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
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
    
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        headerLabel.text = R.string.localizable.locationPermissionTitle()
        headerLabel.font = UIFont.boldSystemFont(ofSize: 20)
        headerLabel.textColor = .white
        return headerLabel
    }()
    
    private lazy var locationIcon: UIImageView = {
        let image = R.image.whiteLocationArrowImage()
        let imageView = UIImageView(image: image)
        imageView.setImageColor(color: CustomColors.shared.coronaLightGray)
        return imageView
    }()
        
    private lazy var askPermissionTitle: UILabel = {
        let askPermissionTitle = UILabel()
        askPermissionTitle.text = R.string.localizable.locationPermissionSubtitle()
        askPermissionTitle.textColor = CustomColors.shared.salmon
        askPermissionTitle.font = UIFont.boldSystemFont(ofSize: 18)
        return askPermissionTitle
    }()
    
    private lazy var askPermissionLabel: UILabel = {
        let askPermissionLabel = UILabel()
        askPermissionLabel.text = R.string.localizable.locationPermissionText()
        askPermissionLabel.textColor = .white
        askPermissionLabel.numberOfLines = 0
        askPermissionLabel.textAlignment = .center
        askPermissionLabel.font = UIFont.systemFont(ofSize: 16)
        return askPermissionLabel
    }()
    
    private lazy var leftButton: CoronaButton = {
        let title = R.string.localizable.locationPermissionSkipButtonTitle()
        let button = CoronaButton(componentState: .clear,
                                  title: title,
                                  color: CustomColors.shared.salmon)
        button.setupButton()
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
            [view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 62),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -62),
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
