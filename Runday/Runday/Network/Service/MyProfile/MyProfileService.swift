//
//  MyProfileService.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Moya

enum MyProfileService {
    case myProfile
}

extension MyProfileService: BaseTargetType {
    var path: String {
        switch self {
        case .myProfile:
            return URLConstant.myPage
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var task: Task{
        return .requestData(sampleData)
    }
    
    var headers: [String : String]? {
        return NetworkConstant.defaultHeader
    }
    
    
}
