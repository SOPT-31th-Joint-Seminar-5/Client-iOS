//
//  ExerciseModel.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import Foundation

struct ExerciseModel {
    let time: String
    let distance: String
    let pace: String
    let calorie: String
}

let exerciseDummyData: ExerciseModel = ExerciseModel(time: "16:03", distance: "10.45km", pace: "3km/h", calorie: "471kcal")
