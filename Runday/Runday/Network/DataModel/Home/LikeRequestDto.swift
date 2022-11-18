//
//  LikeRequestDto.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Foundation

// MARK: - LikeRequestDto
struct LikeRequestDto: Codable {
    let status: Int
    let success: Bool
    let message: String
    let data: DataClass
}

// MARK: - DataClass
struct DataClass: Codable {
    let id: Int
    let isLiked: Bool
    let runID, userID: Int

    enum CodingKeys: String, CodingKey {
        case id, isLiked
        case runID = "runId"
        case userID = "userId"
    }
}
