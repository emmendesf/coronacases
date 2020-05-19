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
    
    private lazy var tipLabel: DescriptiveLabel = {
        return DescriptiveLabel(text: tip)
    }()
    
    private lazy var containerView: UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        
        return view
    }()
}

extension TipView: ViewCodeProtocol {
    func setupHierarchy() {
        addSubview(containerView)
        containerView.addSubview(tipRepresentationImageView)
        containerView.addSubview(tipLabel)
    }
    
    func setupConstraints() {
        
        containerView.constraint { view in
            [view.topAnchor.constraint(equalTo: topAnchor),
             view.bottomAnchor.constraint(equalTo: safeArea().bottomAnchor),
             view.leadingAnchor.constraint(equalTo: safeArea().leadingAnchor),
             view.trailingAnchor.constraint(equalTo: safeArea().trailingAnchor)]
        }
        
        tipRepresentationImageView.constraint { view in
            [view.centerXAnchor.constraint(equalTo: containerView.centerXAnchor),
             view.centerYAnchor.constraint(equalTo: containerView.centerYAnchor)]
        }
        
        tipLabel.constraint { view in
            [view.topAnchor.constraint(equalTo: tipRepresentationImageView.bottomAnchor, constant: 15),
             view.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
             view.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30)]
        }
    }
}
