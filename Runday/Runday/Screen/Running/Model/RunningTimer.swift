//
//  RunningTimer.swift
//  Runday
//
//  Created by 장석우 on 2022/11/17.
//

import Foundation

//MARK: - Error
enum TimeError : Error{
    case timeOver
}

class RunningTimer{
    
    //MARK: - Properties
    
    var targetSecond : Float
    var currentSecond : Float
    var ratio : Float{
        return (targetSecond - currentSecond) / targetSecond
    }
    //MARK: - Life Cycle

    init(second: Float){
        self.targetSecond = second
        self.currentSecond = second
    }
    
    //MARK: - Custom Method
    
    func decreaseTime(_ second: Float) throws {
        
        guard currentSecond >= 0 else { throw TimeError.timeOver}
        currentSecond -= second
        print(Int(currentSecond))
    }
    
    
//    private func transformTotalSecondToTime(_ totalSecond : Int) -> Time{
//        let minute = totalSecond / 60
//        let second = totalSecond % 60
//        return Time(minute: minute, second: second)
//    }
//
//    private func transformTimeToTotalSecond(_ time: Time) -> Int{
//        let minute = time.minute
//        let second = time.second
//        let totalSecond = minute * 60 + second
//        return totalSecond
//    }
    
//    private func transformTimeToString(_ time: Time) -> String{
//
//    }
    
}
