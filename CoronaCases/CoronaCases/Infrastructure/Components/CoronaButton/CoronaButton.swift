//
//  CoronaButton.swift
//  CovidCases
//
//  Created by Caio Roberto on 20/03/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class CoronaButton: UIButton {
    
    private let componentState: ButtonState
    private let title: String
    private let color: UIColor
    
    init(componentState: ButtonState,
         title: String,
         color: UIColor) {
        self.componentState = componentState
        self.title = title
        self.color = color
        super.init(frame: .zero)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupButton() {
        self.layer.cornerRadius = 22
        self.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        self.setTitle(title, for: .normal)
        self.layer.borderColor = color.cgColor

        switch componentState {
        case .filled:
            self.backgroundColor = color
            self.setTitleColor(CustomColors.shared.coronaDarkGray, for: .normal)
        case .clear:
            self.backgroundColor = .clear
            self.setTitleColor(color, for: .normal)
            self.layer.borderWidth = 0.7
        }
    }
}
