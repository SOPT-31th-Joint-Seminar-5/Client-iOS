//
//  RunGaugeModel.swift
//  Runday
//
//  Created by 장석우 on 2022/11/23.
//

import Foundation

struct RunningModel{
    let speed: Speed
    let second: Int
}

extension RunningModel {
    static let sampleData = [
        RunningModel(speed: .walk, second: 9),
        RunningModel(speed: .fastRun, second: 5),
        RunningModel(speed: .slowRun, second: 10),
        RunningModel(speed: .fastRun, second: 5),
        RunningModel(speed: .slowRun, second: 10),
        RunningModel(speed: .fastRun, second: 5),
        RunningModel(speed: .slowRun, second: 10),
        RunningModel(speed: .fastRun, second: 5),
        RunningModel(speed: .slowRun, second: 10),
        RunningModel(speed: .fastRun, second: 5),
        RunningModel(speed: .walk, second: 9)
    ]
    
    static let sampleData2 = [
        RunningModel(speed: .walk, second: 1),
        RunningModel(speed: .fastRun, second: 2),
        RunningModel(speed: .slowRun, second: 3),
        RunningModel(speed: .fastRun, second: 2),
        RunningModel(speed: .slowRun, second: 3),
        RunningModel(speed: .fastRun, second: 2),
        RunningModel(speed: .slowRun, second: 3),
        RunningModel(speed: .fastRun, second: 2),
        RunningModel(speed: .slowRun, second: 3),
        RunningModel(speed: .fastRun, second: 2),
        RunningModel(speed: .walk, second: 1)
    ]
    
    static let sampleData3 = [
        RunningModel(speed: .walk, second: 1),
        RunningModel(speed: .fastRun, second: 2),
        RunningModel(speed: .slowRun, second: 3),
        RunningModel(speed: .fastRun, second: 2)
    ]
}
