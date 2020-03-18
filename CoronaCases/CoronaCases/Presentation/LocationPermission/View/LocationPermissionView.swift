//
//  LocationPermissionView.swift
//  CoronaCases
//
//  Created by Caio Roberto on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import UIKit

final class LocationPermissionView: UIView {
    
    init() {
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
        headerLabel.textColor = CustomColors.shared.coronaDarkGray
        return headerLabel
    }()
    
    private lazy var locationIcon: UIImageView = {
        let image = R.image.locationArrowImage()
        let label = UILabel()
        return UIImageView(image: image)
    }()
        
    private lazy var askPermissionTitle: UILabel = {
        let askPermissionTitle = UILabel()
        askPermissionTitle.text = R.string.localizable.locationPermissionSubtitle()
        askPermissionTitle.textColor = CustomColors.shared.coronaDarkGray
        askPermissionTitle.font = UIFont.boldSystemFont(ofSize: 18)
        return askPermissionTitle
    }()
    
    private lazy var askPermissionLabel: UILabel = {
        let askPermissionLabel = UILabel()
        askPermissionLabel.text = R.string.localizable.locationPermissionText()
        askPermissionLabel.textColor = CustomColors.shared.coronaDarkGray
        askPermissionLabel.numberOfLines = 0
        askPermissionLabel.textAlignment = .center
        askPermissionLabel.font = UIFont.systemFont(ofSize: 16)
        return askPermissionLabel
    }()
    
    private lazy var leftButton: UIButton = {
        let title = R.string.localizable.locationPermissionSkipButtonTitle()
        let button = makeButton(buttonTitle: title)
        return button
    }()
    
    private lazy var separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = CustomColors.shared.coronaDarkGray
        return view
    }()
    
    private lazy var rightButton: UIButton = {
        let title = R.string.localizable.locationPermissionAllowButtonTitle()
        let button = makeButton(buttonTitle: title)
        return button
    }()
    
    private func makeButton(buttonTitle: String) -> UIButton {
        let button = UIButton()
        button.layer.borderWidth = 0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(CustomColors.shared.coronaDarkGray, for: .normal)
        button.setTitle(buttonTitle, for: .normal)
        return button
    }
}

extension LocationPermissionView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(headerLabel)
        addSubview(locationIcon)
        addSubview(askPermissionTitle)
        addSubview(askPermissionLabel)
        addSubview(separatorView)
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
             view.widthAnchor.constraint(equalToConstant: 132),
             view.heightAnchor.constraint(equalToConstant: 109)]
        }
        
        askPermissionLabel.constraint { view in
            [view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 62),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -62),
             view.topAnchor.constraint(equalTo: askPermissionTitle.bottomAnchor, constant: 15)]
        }

        separatorView.constraint { view in
            [view.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -50),
             view.widthAnchor.constraint(equalToConstant: 1.35),
             view.heightAnchor.constraint(equalToConstant: 35),
             view.centerXAnchor.constraint(equalTo: centerXAnchor)]
        }

        leftButton.constraint { view in
            [view.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
             view.trailingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: -40),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 40),
             view.heightAnchor.constraint(equalToConstant: 35)]
        }

        rightButton.constraint { view in
             [view.centerYAnchor.constraint(equalTo: separatorView.centerYAnchor),
              view.leadingAnchor.constraint(equalTo: separatorView.trailingAnchor, constant: 40),
              view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40)]
        }
    }
    
    func additionalSetup() {
        backgroundColor = .white
    }
}
