//
//  RunGaugeModel.swift
//  Runday
//
//  Created by 장석우 on 2022/11/23.
//

import Foundation

struct RunGaugeModel{
    let speed: Speed
    let second: Int
}

extension RunGaugeModel {
    static let sampleData = [
        RunGaugeModel(speed: .walk, second: 9),
        RunGaugeModel(speed: .fastRun, second: 5),
        RunGaugeModel(speed: .slowRun, second: 10),
        RunGaugeModel(speed: .fastRun, second: 5),
        RunGaugeModel(speed: .slowRun, second: 10),
        RunGaugeModel(speed: .fastRun, second: 5),
        RunGaugeModel(speed: .slowRun, second: 10),
        RunGaugeModel(speed: .fastRun, second: 5),
        RunGaugeModel(speed: .slowRun, second: 10),
        RunGaugeModel(speed: .fastRun, second: 5),
        RunGaugeModel(speed: .walk, second: 9)
    ]
}
