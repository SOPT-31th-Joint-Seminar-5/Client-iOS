//
//  Double.swift
//  Runday
//
//  Created by 장석우 on 2022/11/16.
//

import UIKit

extension Double {
    var adjusted: Double {
        let ratio: Double = Double(UIScreen.main.bounds.width) / 390
        let ratioH: Double = Double(UIScreen.main.bounds.height) / 844
        return ratio <= ratioH ? self * ratio : self * ratioH
    }
}
