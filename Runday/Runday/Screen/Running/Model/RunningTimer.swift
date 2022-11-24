//
//  RunningTimer.swift
//  Runday
//
//  Created by 장석우 on 2022/11/17.
//

import Foundation

//MARK: - Protocol
protocol RunningTimerDelegate : AnyObject{
    func secondsChanged(_ timeString: String)
    func stepChanged(to stepIndex: Int)
    func timeOver()
}

//MARK: - Running Timer
class RunningTimer{
    
    //MARK: - Properties
    var timer : Timer?
    weak var delegate : RunningTimerDelegate? {
        didSet{
            secondsChanged()
        }
    }
    var runningData : [RunningModel]
    var targetSecond : Int
    var currentSecond : Int
    
    var passedTime = 0
    var stepIndex = 0

    var timeTitle: String{
        return transformToString(currentSecond)
    }
    
    //MARK: - Life Cycle
    
    init(_ runningData: [RunningModel]){
        var totalSecond = 0
        runningData.forEach { totalSecond += $0.second }
        print(totalSecond)
        self.runningData = runningData
        self.targetSecond = totalSecond
        self.currentSecond = totalSecond
    }
    
    //MARK: - Custom Method
    
    func play(){
        secondsChangedTimer()
        stepChangedTimer()
    }
    
    private func secondsChangedTimer(){
        delegate?.secondsChanged(timeTitle)
        timer = Timer.scheduledTimer(timeInterval: 1,
                                         target: self,
                                         selector: #selector(secondsChanged),
                                         userInfo: nil,
                                         repeats: true)
        
    }
    
    private func stepChangedTimer(){
        for runningModel in runningData{
            DispatchQueue.main.asyncAfter(deadline: .now() + TimeInterval(passedTime)) {
                self.delegate?.stepChanged(to: self.stepIndex)
                self.stepIndex += 1
            }
            passedTime += runningModel.second
        }
    }
    
    private func timeOver(){
        delegate?.timeOver()
        timer?.invalidate()
    }
    
    @objc private func secondsChanged(){
        currentSecond -= 1
        if currentSecond < 0 {
            timeOver()
        }
        delegate?.secondsChanged(timeTitle)
    }
}



//MARK: - String 변환 함수
extension RunningTimer{
    
    private func transformToString(_ totalSeconds: Int) -> String{
        
        // +1 한 이유 '9초 ~ 0초'가 아닌 '10초 ~ 1초'로 설정하고 timeOver 예외처리의 Catch부에서 0초로 설정한다. => '10초 ~ 0초'
        let totalSeconds = totalSeconds + 1
        
        
        var minutes = String(totalSeconds / 60)
        var seconds = String(totalSeconds % 60)
        
        minutes = makeTwoDigit(minutes)
        seconds = makeTwoDigit(seconds)
        
        return "\(minutes):\(seconds)"
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
