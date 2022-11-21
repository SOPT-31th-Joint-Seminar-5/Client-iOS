//
//  NetworkError.swift
//  Runday
//
//  Created by 박의서 on 2022/11/21.
//

import Foundation

// MARK: - NetworkError
enum APIError: Error {
    case urlEncodingError
    case clientError(message: String?)  // 4XX
    case serverError                    // 5XX
}
