//
//  Constant.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import Foundation

struct Constant{
    //콘스탄트!
    static let baseURL = (Bundle.main.infoDictionary?["BASE_URL"] as! String).replacingOccurrences(of: " ", with: "")
}
