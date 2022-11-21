//
//  NetworkError.swift
//  Runday
//
//  Created by 박의서 on 2022/11/21.
//

import Foundation

// MARK: - NetworkError
struct NetworkError: Codable {
    let status: Int
    let success: Bool
    let message: String
}
