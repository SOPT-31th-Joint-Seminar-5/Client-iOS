//
//  LikeService.swift
//  Runday
//
//  Created by 박의서 on 2022/11/19.
//

import Moya

enum LikeService {
    case like(param: LikeRequestDto)
    case dislike(param: LikeResponseDto)
}

extension LikeService : BaseTargetType {
    var path: String {
        switch self {
        case .like(param: _):
            return URLConstant.like
        case .dislike(param: _):
            return URLConstant.dislike
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .like(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        case .dislike(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.defaultHeader
    }
}
