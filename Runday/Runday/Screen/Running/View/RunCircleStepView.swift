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
        $0.font = .rundayRopaMixProExtraBoldItalic(ofSize: 17)
        $0.textColor = .black
        $0.alpha = 0.4
        $0.textAlignment = .center
    }
    
    private lazy var speedLabel = UILabel().then{
        $0.font = .rundayBold(ofSize: 15)
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

    init(_ runningModel : RunningModel?){
        self.time = String(runningModel?.second ?? 0)
        self.speed = runningModel?.speed ?? .walk
        
        super.init(frame: .zero)
        
        updateData(runningModel)
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
    
    func updateData(_ runningModel: RunningModel?){
        guard let runningModel = runningModel else {
            self.isHidden = true
            return
        }
        
        self.isHidden = false
        timeLabel.text = transformToString(runningModel.second)
        speedLabel.text = runningModel.speed.title
    }
    
}


extension RunCircleStepView{
    
    private func transformToString(_ totalSecond: Int) -> String{
        var minute = String(totalSecond / 60)
        var second = String(totalSecond % 60)
        
        minute = makeTwoDigit(minute)
        second = makeTwoDigit(second)
        
        return "\(minute):\(second)"
    }
    
    // 만약 분 혹은 초의 문자열이 한자릿수이면 앞에 0을 붙혀 무조건 두자리수의 String값이 나오게 한다.
    private func makeTwoDigit(_ string:String) -> String{
        
        if string.count == 1{
            return "0\(string)"
        } else {
            return string
        }
    }
}
