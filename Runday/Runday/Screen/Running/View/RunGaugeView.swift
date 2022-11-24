//
//  RunStepView.swift
//  Runday
//
//  Created by 장석우 on 2022/11/16.
//

import UIKit
import SnapKit
import Then

class RunGaugeView :UIView{
    
    //MARK: - Properties
    private var speedType : Speed
    var second : Int
    
    private var gaugeBackGroundColor : UIColor{
        switch speedType {
        case .walk: return .rundayGray2
        case .slowRun: return .rundayGray3
        case .fastRun: return .rundayGray4
        }
    }
    
    private var gaugeHeight : CGFloat{
        switch speedType{
        case .walk: return 14.adjusted
        case .slowRun: return 30.adjusted
        case .fastRun: return 70.adjusted
        }
    }
    
    //MARK: - UI Components
    
    private lazy var rootView : UIView = {
        let view = UIView()
        view.backgroundColor = gaugeBackGroundColor
        view.clipsToBounds = true
        return view
    }()
    
    private lazy var fillView : UIView = {
        let view = UIView()
        view.backgroundColor = .rundayBlue.withAlphaComponent(0.8)
        return view
    }()
    
    //MARK: - Life Cycle
   
    init(_ runningModel: RunningModel){
        self.speedType = runningModel.speed
        self.second = runningModel.second
        
        super.init(frame: .zero)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize{
        return CGSize(width: CGFloat(second), height: gaugeHeight)
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
    
    private func setLayout(){
        self.snp.makeConstraints {
            $0.height.equalTo(gaugeHeight)
        }
        
        self.addSubview(rootView)
        rootView.addSubview(fillView)
        
        rootView.snp.makeConstraints {
            $0.top.bottom.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(1)
        }
        
        fillView.snp.makeConstraints {
            $0.top.bottom.leading.equalToSuperview()
        }
    }
    
    func fillRunGaugeView(){
        UIView.animate(withDuration: TimeInterval(second)) {
            self.fillView.snp.makeConstraints {
                $0.trailing.equalToSuperview()
            }
            self.layoutIfNeeded()
        }
    }
    
}
