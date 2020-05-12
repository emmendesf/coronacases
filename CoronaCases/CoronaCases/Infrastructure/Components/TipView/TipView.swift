//
//  TipView.swift
//  CovidCases
//
//  Created by Caio Roberto on 07/04/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

final class TipView: UIView {
    
    private let image: UIImage
    private let tip: String
    
    init(image: UIImage, tip: String) {
        self.image = image
        self.tip = tip
        super.init(frame: .zero)
        buildView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private lazy var tipRepresentationImageView: UIImageView = {
        return UIImageView(image: image)
    }()
    
    private lazy var tipLabel: UILabel = {
        let label = UILabel()
        label.text = tip
        label.textColor = .white
        label.numberOfLines = 0
        label.textAlignment = .center
        label.font = CovidCasesFonts.complementTextFont
        
        return label
    }()
}

extension TipView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(tipRepresentationImageView)
        addSubview(tipLabel)
    }
    
    func setupConstraints() {
        tipRepresentationImageView.constraint { view in
            [view.centerXAnchor.constraint(equalTo: centerXAnchor),
             view.centerYAnchor.constraint(equalTo: centerYAnchor)]
        }
        
        tipLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: tipRepresentationImageView.bottomAnchor, constant: 15),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 62),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -62)]
        }
    }
}
