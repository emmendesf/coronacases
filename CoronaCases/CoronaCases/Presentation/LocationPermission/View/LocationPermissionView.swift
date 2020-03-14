//
//  LocationPermissionView.swift
//  CoronaCases
//
//  Created by Caio Roberto on 14/03/20.
//  Copyright © 2020 Emerson Mendes Filho. All rights reserved.
//

import UIKit

final class LocationPermissionView: UIView {
    
    private lazy var headerLabel: UILabel = {
        let headerLabel = UILabel()
        return headerLabel
    }()
    
    private lazy var locationIcon: UILabel = {
        let iconLabel = UILabel()
        return iconLabel
    }()
    
    private lazy var explanationLabel: UILabel = {
        let explanationLabel = UILabel()
        return explanationLabel
    }()
    
    private lazy var leftButton: UIButton = {
        return makeButton()
    }()
    
    private lazy var rightButton: UIButton = {
        return makeButton()
    }()
    
    private func makeButton() -> UIButton {
        let button = UIButton()
        button.layer.borderWidth = 0.0
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        return button
    }
}

extension LocationPermissionView: ViewCodeProtocol {
    func setupHierarchy() {
    
    }
    
    func setupConstraints() {
        
    }
}
