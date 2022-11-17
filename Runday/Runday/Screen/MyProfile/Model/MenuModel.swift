//
//  MenuModel.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import Foundation

struct MenuModel {
    var image: String
    var content: String
    var swiftImage: String = "right-shift"
}

let friendMenu: MenuModel = MenuModel(image: "friend", content: "친구 관리")
let friendInviteMenu: MenuModel = MenuModel(image: "friend", content: "친구 초대 링크")
