//
//  MyPageResponseDto.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Foundation

// MARK: - MyProfileResponseDto
struct MyProfileResponseDTO: Codable {
    let status: Int
    let message: String
    let data: [MyProfileResponseData]
}

// MARK: - MyProfileResponseData
struct MyProfileResponseData: Codable {
    let id: Int
    let name, time, distance, pace: String
    let calorie, date: String
}

