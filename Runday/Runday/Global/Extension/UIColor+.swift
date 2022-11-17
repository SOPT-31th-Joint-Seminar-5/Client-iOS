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
    
    class var rundayPurple: UIColor {
        return UIColor(r: 99, g: 78, b: 255)
    }
    
    class var rundayWhite: UIColor {
        return UIColor(r: 255, g: 255, b: 255)
    }
    
    class var rundayGray1: UIColor {
        return UIColor(r: 232, g: 234, b: 241)
    }
    
    class var rundayGray2: UIColor {
        return UIColor(r: 194, g: 198, b: 206)
    }
    
    class var rundayGray3: UIColor {
        return UIColor(r: 144, g: 148, b: 158)
    }
    
    class var rundayGray4: UIColor {
        return UIColor(r: 114, g: 119, b: 133)
    }
    
    class var rundayGray5: UIColor {
        return UIColor(r: 86, g: 93, b: 111)
    }
    
    class var rundayGray6: UIColor {
        return UIColor(r: 129, g: 133, b: 148)
    }
    
    class var rundayGray7: UIColor {
        return UIColor(r: 247, g: 248, b: 250)
    }
    
    class var rundayBlack: UIColor {
        return UIColor(r: 28, g: 31, b: 39)
    }
    
    class var rundayBlack1: UIColor {
        return UIColor(r: 30, g: 32, b: 38)
    }
    
    
    
    
}
