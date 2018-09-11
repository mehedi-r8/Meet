//
//  CircleImage.swift
//  Meet
//
//  Created by MEHEDI.R8 on 9/12/18.
//  Copyright © 2018 mehedi.r8. All rights reserved.
//

import UIKit

@IBDesignable
class CircleImage: UIImageView {
    
    override func awakeFromNib() {
        setupView()
    }

    func setupView() {
        self.layer.cornerRadius = self.frame.width / 2
        self.clipsToBounds = true
    }
    
    override func prepareForInterfaceBuilder() {
        setupView()
    }

}
