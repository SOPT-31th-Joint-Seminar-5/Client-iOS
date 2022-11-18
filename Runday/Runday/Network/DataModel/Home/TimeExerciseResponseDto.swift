//
//  TimeExerciseDto.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Foundation

// MARK: - TimeExerciseResponseDto
struct TimeExerciseResponseDto: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let user: [User]
}

// MARK: - User
struct User: Codable {
    let id: Int
    let title, routine, stage: String
    let isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case id, title, routine, stage
        case isLiked = "is_liked"
    }
}
