//
//  RunStepView.swift
//  Runday
//
//  Created by 장석우 on 2022/11/16.
//

import UIKit
import SnapKit
import Then

extension Speed{
    
    var gaugeBackGroundColor : UIColor{
        
        switch self{
        case .walk: return .rundayGray2
        case .slowRun: return .rundayGray3
        case .fastRun: return .rundayGray4
        }
    }
    
    var gaugeWidth : CGFloat{
        
        switch self{
        case .walk:  return 36.adjusted
        case .slowRun: return 40.adjusted
        case .fastRun: return 20.adjusted
        }
    }
    
    var gaugeHeight : CGFloat{
        
        switch self{
        case .walk: return 14.adjusted
        case .slowRun: return 30.adjusted
        case .fastRun: return 70.adjusted
        }
    }
    
    func makeRunGaugeView() -> UIView{
        let view = UIView()
        view.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        view.layer.cornerRadius = 3
        view.backgroundColor = gaugeBackGroundColor
        
        view.snp.makeConstraints {
            $0.width.equalTo(gaugeWidth)
            $0.height.equalTo(gaugeHeight)
        }
        
        return view
    }
    
}
