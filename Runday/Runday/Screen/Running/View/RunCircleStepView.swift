//
//  RunStepView.swift
//  Runday
//
//  Created by 장석우 on 2022/11/16.
//

import UIKit
import SnapKit
import Then

class RunCircleStepView : UIView{
    
    //MARK: - Properties
    
    private var time: String
    
    private var speed: Speed
    
    //MARK: - UI Components
    
    private let timeLabel = UILabel().then{
        $0.font = .rundayRopaMixProExtraBoldItalic(ofSize: 18)
        $0.textColor = .black
        $0.alpha = 0.4
        $0.textAlignment = .center
    }
    
    private lazy var speedLabel = UILabel().then{
        $0.font = .rundayBold(ofSize: 16)
        $0.textColor = .rundayGray5
        $0.numberOfLines = 2
        $0.textAlignment = .center
    }
    
    private lazy var verticalStackView = UIStackView(arrangedSubviews:
                                                        [timeLabel,
                                                         speedLabel]).then{
        $0.axis = .vertical
        $0.spacing = 0
        $0.distribution = .fill
        $0.alignment = .center
    }

    //MARK: - Life Cycle

    init(time: String, speed: Speed){
        self.time = time
        self.speed = speed
        
        super.init(frame: .zero)
        
        updateData()
        setUI()
        setLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = self.frame.width / 2
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        backgroundColor = .rundayWhite
        layer.borderColor = UIColor.rundayBlue.withAlphaComponent(0.6).cgColor
        layer.borderWidth = 4
    }
    
    private func setLayout(){
        
        self.addSubviews(verticalStackView)
        
        verticalStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    private func updateData(){
        timeLabel.text = time
        speedLabel.text = speed.twoLineTitle
    }
    
    
    
    
}
