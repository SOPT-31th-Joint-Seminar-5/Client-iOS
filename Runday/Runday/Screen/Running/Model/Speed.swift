//
//  Speed.swift
//  Runday
//
//  Created by 장석우 on 2022/11/16.
//

import Foundation

enum Speed{
    case walk
    case slowRun
    case fastRun
    
    var title : String{
        
        switch self{
        case .walk:
            return "준비 걷기"
        case .slowRun:
            return "천천히 달리기"
        case .fastRun:
            return "빨리 달리기"
        }
    }
    
    var twoLineTitle : String{
        switch self{
        case .walk:
            return "준비\n걷기"
        case .slowRun:
            return "천천히\n달리기"
        case .fastRun:
            return "빨리\n달리기"
        }
    }
}
