//
//  URL.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import Foundation

struct URLConstant{
    // MARK: - baseURL
    
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
    
    // MARK: - Home
    
    static let run = "/run/"
    static let like = "/run/like/"
    static let dislike = "/run/like/delete/"
    
    // MARK: - MyProfile
    
    static let myPage = "/myPage/"
}
