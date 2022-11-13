//
//  UIFont+.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import UIKit

//MARK: - Custom Font
extension UIFont{
    
    class func rundayBold(ofSize size: CGFloat) -> UIFont {
                 return UIFont(name: "NotoSansKR-Bold", size: size)!
         }
    class func rundayMedium(ofSize size: CGFloat) -> UIFont {
                 return UIFont(name: "NotoSansKR-Medium", size: size)!
         }
    class func rundayRegular(ofSize size: CGFloat) -> UIFont {
                 return UIFont(name: "NotoSansKR-Regular", size: size)!
         }
    class func rundayRopaMixProExtraBoldItalic(ofSize size: CGFloat) -> UIFont {
                 return UIFont(name: "RopaMixPro-ExtraBoldItalic", size: size)!
         }
}
