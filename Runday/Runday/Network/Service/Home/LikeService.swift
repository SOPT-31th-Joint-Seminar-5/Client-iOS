//
//  LikeService.swift
//  Runday
//
//  Created by 박의서 on 2022/11/19.
//

import Moya

enum LikeService {
    case like(body: CommonRequestDTO)
    case dislike(body: CommonRequestDTO)
}

extension LikeService : BaseTargetType {
    var path: String {
        switch self {
        case .like:
            return URLConstant.like + UserModel.userID
        case .dislike:
            return URLConstant.dislike + UserModel.userID
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .put
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .like(body: let body):
            return .requestParameters(parameters: try! body.asParameter(), encoding: JSONEncoding.default)
        case .dislike(body: let body):
            return .requestParameters(parameters: try! body.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.defaultHeader
    }
}
