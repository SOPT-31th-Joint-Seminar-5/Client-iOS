//
//  LikeResponseDto.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Foundation

// MARK: - LikeResponseDto
struct LikeResponseDto: Codable {
    let status: Int
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id, userID, runID: Int
    let isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case id
        case userID = "userId"
        case runID = "runId"
        case isLiked
    }
}
