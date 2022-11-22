//
//  TimeExerciseService.swift
//  Runday
//
//  Created by 박의서 on 2022/11/19.
//

import Moya

enum TimeExerciseService {
    case timeExercise
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
        case .timeExercise:
            return .requestPlain
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.defaultHeader
    }
    
    
}
