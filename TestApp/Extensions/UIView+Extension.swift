//
//  UIView+Extension.swift
//  WeatherTestApp
//
//  Created by Vitalii Sydorskyi on 1/18/20.
//  Copyright © 2020 Vitalii Sydorskyi. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    
    static func nib() -> UINib {
        
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    static func reuseIdentifier() -> String {
        
        return String(describing: self)
    }
}
