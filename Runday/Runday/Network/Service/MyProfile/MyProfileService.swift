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
            return URLConstant.
        }
    }
    
    var method: Moya.Method {
        <#code#>
    }
    
    var task: Moya.Task {
        <#code#>
    }
    
    var headers: [String : String]? {
        <#code#>
    }
    
    
}
