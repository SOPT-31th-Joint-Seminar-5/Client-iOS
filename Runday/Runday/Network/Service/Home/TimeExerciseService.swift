//
//  TimeExerciseService.swift
//  Runday
//
//  Created by 박의서 on 2022/11/19.
//

import Moya

enum TimeExerciseService {
    case timeExercise(body: CommonRequestDTO)
}

extension TimeExerciseService: BaseTargetType {
    var path: String {
        switch self {
        case .timeExercise:
            return URLConstant.run + UserModel.userID
        }
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .timeExercise(body: let body):
            return .requestParameters(parameters: try! body.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.defaultHeader
    }
    
    
}
