//
//  RunningTimer.swift
//  Runday
//
//  Created by 장석우 on 2022/11/17.
//

import Foundation

//MARK: - Protocol
protocol RunningTimerDelegate  : AnyObject{
    func secondsChanged(_ stepTime: String,_ totalTime: String)
    func stepChanged(to stepIndex: Int)
    func timeOver()
}

//MARK: - Running Timer
class RunningTimer{
    
    //MARK: - Properties
    private var timer : Timer?
    weak var delegate : RunningTimerDelegate?
    private var runningData : [RunningModel]
    
    private var totalSecond : Int
    private var currentTotalSecond : Int
    private var currentStepSecond : Int
    
    private var stepIndex = 0
    
    private var stepTime: String{
        return transformToString(currentStepSecond)
    }
    private var totalTime: String{
        return transformToString(currentTotalSecond)
    }
    
    //MARK: - Life Cycle
    
    init(_ runningData: [RunningModel]){
        var totalSecond = 0
        runningData.forEach { totalSecond += $0.second }
        
        self.runningData = runningData
        self.currentTotalSecond = totalSecond
        self.totalSecond = totalSecond
        self.currentStepSecond = runningData[0].second
    }
    
    //MARK: - Custom Method
    
    func play(){
        timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(secondsChanged),
                                         userInfo: nil,
                                         repeats: true)
        
        delegate?.secondsChanged(stepTime, totalTime)
        delegate?.stepChanged(to: stepIndex)

    }
    
    private func timeOver(){
        delegate?.timeOver()
        timer?.invalidate()
    }
    
    @objc private func secondsChanged(){
        currentTotalSecond -= 1
        currentStepSecond -= 1
    
        if currentStepSecond == 0 {
            stepChanged()
            return
        }
        delegate?.secondsChanged(stepTime, totalTime)
    }
    
    private func stepChanged(){
        stepIndex += 1
        if stepIndex == runningData.count {
            timeOver()
            return
        }
        currentStepSecond = runningData[stepIndex].second
        delegate?.secondsChanged(stepTime,totalTime)
        delegate?.stepChanged(to: stepIndex)
    }
}



//MARK: - String 변환 함수
extension RunningTimer{
    
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
