//
//  TimeExerciseAPI.swift
//  Runday
//
//  Created by 장석우 on 2022/11/22.
//

import Moya

final class LikeAPI{
    static let shared = LikeAPI()
    private let likeProvider = MoyaProvider<LikeService>(plugins: [NetworkLoggerPlugin(verbose: true)])
    private init() { }
}

extension LikeAPI{
    func putLike(for data: CommonRequestDTO, completion: @escaping (LikeResponseData?) -> ()){
        
        likeProvider.request(.like(body: data)) { result in
            
            switch result{
            case .success(let response):
                do {
                    guard let response =  try response.map(LikeResponseDTO?.self)
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
    
    func putDislike(for data: CommonRequestDTO, completion: @escaping (LikeResponseData?) -> ()){
        
        likeProvider.request(.dislike(body: data)) { result in
            
            switch result{
            case .success(let response):
                do {
                    guard let response =  try response.map(LikeResponseDTO?.self)
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
