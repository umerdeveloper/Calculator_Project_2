//
//  RoundButton.swift
//  Calculator_Project_2
//
//  Created by Umer Khan on 27/03/2020.
//  Copyright © 2020 Umer Khan. All rights reserved.
//

import UIKit

@IBDesignable
class RoundButton: UIButton {
    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
}
