////
////  RunStepView.swift
////  Runday
////
////  Created by 장석우 on 2022/11/16.
////
//
//import UIKit
//import SnapKit
//import Then
//
//enum RunStepView {
//    case previous(period: String, speed: Speed)
//    case next(period: String, speed: Speed)
//    
//    //MARK: - Properties
//    
//    private var runStepViewCornerMask :CACornerMask{
//        
//        switch self{
//        case .previous:
//            return [.layerMaxXMaxYCorner,.layerMaxXMinYCorner]
//        case .next:
//            return [.layerMinXMinYCorner,.layerMinXMaxYCorner]
//        }
//    }
//    
//    func build() -> UIView{
//        
//        switch self{
//        case .previous(let period, let speed),
//                .next(let period, let speed):
//            return makeRunStepView(period, speed)
//        }
//    }
//    
//    //MARK: - Custom Method
//    
//    private func makeRunStepView(_ period: String,_  speed: Speed) -> UIView{
//        
//        let view = UIView()
//        view.backgroundColor = .rundayGray2
//        view.layer.cornerRadius = 50
//        view.layer.maskedCorners = runStepViewCornerMask
//        //MARK: - UI Components
//        
//        let periodLabel = UILabel().then{
//            $0.text = period
//            $0.font = .rundayRopaMixProExtraBoldItalic(ofSize: 18)
//            $0.textColor = .black
//            $0.alpha = 0.4
//            $0.numberOfLines = 2
//            $0.textAlignment = .center
//        }
//        
//        let speedLabel = UILabel().then{
//            $0.text = speed.twoLineTitle
//            $0.font = .rundayBold(ofSize: 16)
//            $0.textColor = .rundayGray5
//            $0.numberOfLines = 2
//            $0.textAlignment = .center
//        }
//        
//        //MARK: - Set Hierarchy
//        
//        view.addSubviews(periodLabel,speedLabel)
//        
//        //MARK: - Set Contraint
//        
//        switch self{
//        case .previous:
//            periodLabel.snp.makeConstraints {
//                $0.top.equalTo(view).offset(50.adjusted)
//                $0.leading.equalToSuperview().offset(41.adjusted)
//            }
//            
//        case .next:
//            periodLabel.snp.makeConstraints {
//                $0.top.equalTo(view).offset(50.adjusted)
//                $0.trailing.equalToSuperview().offset(-41.adjusted)
//            }
//        }
//        
//        speedLabel.snp.makeConstraints {
//            $0.top.equalTo(periodLabel.snp.bottom)
//            $0.centerX.equalTo(periodLabel)
//        }
//        
//        return view
//    }
//    
//    
//}
