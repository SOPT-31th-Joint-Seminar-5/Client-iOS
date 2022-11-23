//
//  RunCircleGaugeView.swift
//  Runday
//
//  Created by 장석우 on 2022/11/24.
//

import UIKit

class RunCircleProgressView : UIView{
    
    //MARK: - Properties
    
    private lazy var semiCirclePath : UIBezierPath = {
        let bezierPath = UIBezierPath(arcCenter: CGPoint(x: frame.width / 2, y: 0),
                                      radius: frame.width / 2,
                                      startAngle: .pi,
                                      endAngle: 0,
                                      clockwise: false)
        return bezierPath
    }()
    
    private lazy var semiCircleLayer : CAShapeLayer = {
        let layer = CAShapeLayer()
        layer.path = semiCirclePath.cgPath
        layer.lineWidth = 7
        layer.lineCap = .round
        layer.strokeColor = UIColor.rundayBlue.cgColor
        layer.fillColor = UIColor.clear.cgColor
        return layer
    }()
    
    private lazy var strokeEndAnimation : CABasicAnimation = {
        let animation = CABasicAnimation(keyPath: "strokeEnd")
        animation.fromValue = 0
        animation.toValue = 1
        animation.duration = 8
        return animation
    }()
    
    //MARK: - Life Cycle
    
    init(_ runningData: [RunningModel]){
        super.init(frame: .zero)
        var sum = 0
        runningData.forEach { sum += $0.second }
        strokeEndAnimation.duration = CFTimeInterval(sum)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        
        self.layer.addSublayer(self.semiCircleLayer)
        self.semiCircleLayer.add(self.strokeEndAnimation, forKey: "strokeEnd")
    }
    
}
