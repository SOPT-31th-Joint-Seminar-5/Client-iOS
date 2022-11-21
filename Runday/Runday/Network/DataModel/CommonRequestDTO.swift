//
//  CommonRequestDTO.swift
//  Runday
//
//  Created by 장석우 on 2022/11/22.
//

import Foundation
struct CommonRequestDTO : Encodable{
    let userId: Int = UserModel.userIDInt
    let runId: Int
}
