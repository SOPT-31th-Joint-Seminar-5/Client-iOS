//
//  MyProfileService.swift
//  Runday
//
//  Created by 박의서 on 2022/11/18.
//

import Moya

enum MyProfileService {
    case myProfile(param: MyProfileResponseDto)
}

extension MyProfileService: BaseTargetType {
    var path: String {
        switch self {
        case .myProfile(param: _):
            return URLConstant.myPage
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .myProfile(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return ["Content-Type": "application/json"]
    }
    
    
}
