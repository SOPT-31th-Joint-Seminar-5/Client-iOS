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
    case secondChange
}

//MARK: - Running Timer
class RunningTimer{
    
    //MARK: - Properties
    
    weak var delegate : RunningTimerDelegate?
    var targetSecond : Float
    var currentSecond : Float
    var integerSecond : Int{
        didSet(oldVal){
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
        guard currentSecond >= 0 else { throw TimeError.timeOver}
        currentSecond -= second
        integerSecond = Int(currentSecond)
    }
    
    private func transformToString(_ totalSeconds: Float) -> String{
        
        let totalSeconds = Int(totalSeconds) + 1
        var minutes = String(totalSeconds / 60)
        var seconds = String(totalSeconds % 60)
        
        minutes = makeTwoDigit(minutes)
        seconds = makeTwoDigit(seconds)
        
        return "\(minutes):\(seconds)"
    }
    
    private func makeTwoDigit(_ string:String) -> String{
        
        if string.count == 1{
            return "0\(string)"
        } else {
            return string
        }
    }
    
}
