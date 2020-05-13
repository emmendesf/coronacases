//
//  DescriptiveLabel.swift
//  CovidCases
//
//  Created by Caio Roberto on 12/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit
class DescriptiveLabel: UILabel {
    
    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        formatLineAndCharacterSpacing()
        self.textColor = .white
        self.numberOfLines = 0
        self.textAlignment = .center
        self.font = CovidCasesFonts.complementTextFont
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
