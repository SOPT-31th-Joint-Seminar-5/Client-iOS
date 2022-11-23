//
//  RunCircleGaugeView.swift
//  Runday
//
//  Created by 장석우 on 2022/11/24.
//

import UIKit

class RunCircleGaugeView : UIView{
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        let path = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: 0),
                                radius: frame.width / 2,
                                startAngle: .pi,
                                endAngle: 0,
                                clockwise: false)
        path.lineCapStyle = .round

        let layer = CAShapeLayer()
        layer.path = path.cgPath
        layer.lineCap = .round
        
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 5
        
        layer.lineWidth = 7
        layer.strokeColor = UIColor.rundayBlue.cgColor
        layer.fillColor = UIColor.clear.cgColor
        
        layer.add(animation, forKey: "strokeEnd")
        
        self.layer.addSublayer(layer)
        
        
    }
}
