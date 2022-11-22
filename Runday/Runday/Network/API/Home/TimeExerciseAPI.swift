//
//  TimeExerciseAPI.swift
//  Runday
//
//  Created by 장석우 on 2022/11/22.
//

import Moya

final class TimeExerciseAPI{
    static let shared = TimeExerciseAPI()
    private let timeExerciseProvider = MoyaProvider<TimeExerciseService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    private init() { }
}

extension TimeExerciseAPI{
    func getTimeExercise(for data: CommonRequestDTO, completion: @escaping (TimeExerciseResponseData?) -> ()){
        
        timeExerciseProvider.request(.timeExercise) { result in
            
            switch result{
            case .success(let response):
                do {
                    guard let response =  try response.map(TimeExerciseResponseDTO?.self)
                    else {
                        print("[디코딩 오류] 서버의 Response 파일과 프로젝트의 response파일이 일치한지 확인하세요.")
                        return
                    }
                    completion(response.data)
                } catch(let err){
                    print("서버와 통신은 가능한데 음.. 서버쪽 오류?")
                    print(err.localizedDescription, 500)
                }
            case .failure(let err):
                print(err.localizedDescription)
                print("통신 자체가 안되버림")
                completion(nil)
            }
        }
    }
}
