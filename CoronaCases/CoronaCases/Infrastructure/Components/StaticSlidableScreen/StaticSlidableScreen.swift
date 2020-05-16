//
//  StaticSlidableScreen.swift
//  CovidCases
//
//  Created by Caio Roberto on 26/04/20.
//  Copyright © 2020 A7&M. All rights reserved.
//

import UIKit

class StaticSlidableScreen: UIViewController {
    
    init(contentView: UIView) {        
        super.init(nibName: nil, bundle: nil)
        self.view = contentView
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
