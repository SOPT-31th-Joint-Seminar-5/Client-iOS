//
//  TimeExerciseService.swift
//  Runday
//
//  Created by 박의서 on 2022/11/19.
//

import Moya

enum TimeExerciseService {
    case timeExercise(userID: String)
}

extension TimeExerciseService: BaseTargetType {
    var path: String {
        switch self {
        case .timeExercise(userID: User.userID)
        
    }
    
    var method: Moya.Method {
        switch self {
        default: return .get
        }
    }
    
    var task: Moya.Task {
        switch self {
        case .timeExercise(param: let param):
            return .requestParameters(parameters: try! param.asParameter(), encoding: JSONEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        return NetworkConstant.defaultHeader
    }
    
    
}
