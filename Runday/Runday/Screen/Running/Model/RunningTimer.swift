//
//  RunningTimer.swift
//  Runday
//
//  Created by 장석우 on 2022/11/17.
//

import Foundation

//MARK: - Protocol
protocol RunningTimerDelegate : AnyObject{
    func secondsChange(_ timeString: String)
}

//MARK: - Error
enum TimeError : Error{
    case timeOver
}

//MARK: - Running Timer
class RunningTimer{
    
    //MARK: - Properties
    
    weak var delegate : RunningTimerDelegate?
    var targetSecond : Float
    var currentSecond : Float
    var integerSecond : Int{
        didSet(oldVal){
            // timer가 1초에 한번씩 변환하게 하기 위한 프로퍼티.
            // didSet(oldVal)을 통해 값이 할당되기 전과 후의 데이터가 다르다면 이벤트 발생.
            // RunninTimer에서 발생한 이벤트를 VC에게 일을 전달하기 위해 delegate 패턴 사용.
            if integerSecond != oldVal { delegate?.secondsChange(timeTitle) }
        }
    }
    
    var ratio : Float{
        return (targetSecond - currentSecond) / targetSecond
    }
    
    var timeTitle: String{
        return transformToString(currentSecond)
    }
    
    //MARK: - Life Cycle
    
    init(second: Float){
        self.targetSecond = second
        self.currentSecond = second
        self.integerSecond = Int(second)
    }
    
    //MARK: - Custom Method
    
    func decreaseTime(_ second: Float) throws {
        
        // 남은 시간이 0초 미만이면 Time Over 예외 처리
        guard currentSecond >= 0 else { throw TimeError.timeOver}
        currentSecond -= second
        integerSecond = Int(currentSecond)
    }
    
    private func transformToString(_ totalSeconds: Float) -> String{
        
        // +1 한 이유 '9초 ~ 0초'가 아닌 '10초 ~ 1초'로 설정하고 timeOver 예외처리의 Catch부에서 0초로 설정한다. => '10초 ~ 0초'
        let totalSeconds = Int(totalSeconds) + 1
        
        
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
