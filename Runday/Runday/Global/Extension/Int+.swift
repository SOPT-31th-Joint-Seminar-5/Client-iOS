//
//  Int+.swift
//  Runday
//
//  Created by 장석우 on 2022/11/16.
//

import UIKit

extension Int {
    var adjusted: Int {
        let ratio: Int = Int(UIScreen.main.bounds.width) / 390
        let ratioH: Int = Int(UIScreen.main.bounds.height) / 844
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}
