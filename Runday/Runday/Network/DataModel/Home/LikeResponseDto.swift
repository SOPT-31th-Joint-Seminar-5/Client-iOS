//
//  LikeResponseDto.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Foundation

// MARK: - LikeResponseDto
struct LikeResponseDTO: Codable {
    let status: Int
    let message: String
    let data: LikeResponseData
}

// MARK: - LikeResponseData
struct LikeResponseData: Codable {
    let id, userID, runID: Int
    let isLiked: Bool

    enum CodingKeys: String, CodingKey {
        case id, isLiked
        case userID = "userId"
        case runID = "runId"
    }
}
