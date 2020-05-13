//
//  UILabel+Extensions.swift
//  CovidCases
//
//  Created by Caio Roberto on 12/05/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

extension UILabel {
    func formatLineAndCharacterSpacing() {
        formatCharacterSpacing()
        formatLineSpacing()
    }

    func formatLineSpacing(lineHeight: CGFloat = 6) {
        if let labelAttributedString = self.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: labelAttributedString)

            let paragraphStyle = NSMutableParagraphStyle()
            paragraphStyle.lineSpacing = lineHeight

            attributedString.addAttribute(NSAttributedString.Key.paragraphStyle,
                                          value: paragraphStyle,
                                          range: NSRange(location: 0,
                                                         length: attributedString.length))
            self.attributedText = attributedString
        }
    }
    
    func formatCharacterSpacing(trackingValue: Double = 1) {
        if let labelAttributedString = self.attributedText {
            let attributedString = NSMutableAttributedString(attributedString: labelAttributedString)
            attributedString.addAttribute(NSAttributedString.Key.kern,
                                          value: trackingValue,
                                          range: NSRange(location: 0,
                                                         length: attributedString.length - 1))
            self.attributedText = attributedString
        }
    }
}
