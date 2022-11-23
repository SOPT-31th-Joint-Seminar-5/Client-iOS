//
//  RunGaugeStackView.swift
//  Runday
//
//  Created by 장석우 on 2022/11/23.
//

import UIKit
import SnapKit

class RunGaugeStackView : UIStackView{
    
    //MARK: - Properties
    
    private var runningData: [RunningModel]
    
    //MARK: - Life Cycle
    
    init(runningData: [RunningModel]) {
        self.runningData = runningData
        
        super.init(frame: .zero)
        
        setUI()
        addArrangedRunGaugeViews()
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        self.axis = .horizontal
        self.alignment = .bottom
        self.spacing = 0
        self.distribution = .fillProportionally
    }
    
    private func addArrangedRunGaugeViews(){
        for runningModel in runningData{
            self.addArrangedSubview(RunGaugeView(runningModel))
        }
    }
}

