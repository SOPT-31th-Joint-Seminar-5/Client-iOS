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
    
    private var runGauges: [RunGaugeModel]
    
    //MARK: - Life Cycle
    
    init(runGauges: [RunGaugeModel]) {
        self.runGauges = runGauges
        
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
        for runGauge in runGauges{
            self.addArrangedSubview(RunGaugeView(runGauge: runGauge))
        }
    }
    
    func fillRunGaugeStackView(){
        var lastSecond = 0
        for view in arrangedSubviews{
            guard let view = view as? RunGaugeView else { return }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(lastSecond)) {
                view.fillRunGaugeView()
            }
            lastSecond += view.second - 1
        }
        
    }
}

