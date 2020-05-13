//
//  TitleLabel.swift
//  CovidCases
//
//  Created by Caio Roberto on 12/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit
class TitleLabel: UILabel {

    init(text: String) {
        super.init(frame: .zero)
        self.text = text
        self.textColor = CustomColors.shared.salmon
        self.font = CovidCasesFonts.secondaryTextFont
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
