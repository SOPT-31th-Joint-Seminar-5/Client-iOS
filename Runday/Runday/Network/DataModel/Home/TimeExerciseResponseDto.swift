//
//  TimeExerciseDto.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Foundation

// MARK: - TimeExerciseResponseDto
struct TimeExerciseResponseDTO: Codable {
    let status: Int
    let message: String
    let data: [TimeExerciseResponseData]
}

// MARK: - TimeExerciseResponseData
//struct TimeExerciseResponseData: Codable {
//    let user: [UserData]
//}

// MARK: - User
struct TimeExerciseResponseData: Codable {
    let id: Int
    let title, routine, stage, highlight: String
    let isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case id, title, routine, stage, highlight
        case isLiked = "is_liked"
    }
    
    func convertToRunList() -> RunModel {
        return RunModel(title: self.title, routine: self.routine, stage: self.stage, highlight: self.highlight, isLiked: self.isLiked)
    }
}
