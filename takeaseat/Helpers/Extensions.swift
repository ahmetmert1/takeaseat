//
//  Extensions.swift
//  Take a Seat
//
//  Created by Ahmet Mert ÖZ on 6.04.2023.
//

import Foundation
import UIKit


extension UIView {
    @IBInspectable var cornerRadius : CGFloat {
        get {
            return cornerRadius
        }
        set {
            self.layer.cornerRadius = newValue
        }
    }
}
