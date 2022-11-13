//
//  UIColor.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g: Int, b: Int) {
        self.init(red: CGFloat(r)/255,green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1)
    }
}

//MARK: - Custom Color
extension UIColor{
    
    class var rundayBlue: UIColor {
        return UIColor(r: 59, g: 109, b: 255)
    }
    
    
}
