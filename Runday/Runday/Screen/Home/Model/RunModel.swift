//
//  HomeModel.swift
//  Runday
//
//  Created by 김민 on 2022/11/16.
//

import Foundation

struct RunModel {
    let title: String
    let routine: String
    let stage: String?
    var isLiked: Bool 
}

let myRunDummyData: [RunModel] = [
    RunModel(title: "1시간 30분\n달리기", routine: "8주 - 총 27회", stage: "중급", isLiked: false),
    RunModel(title: "50분 달리기\n도전", routine: "4주 - 총 12회", stage: "중급", isLiked: false),
    RunModel(title: "30분 달리기\n도전", routine: "매일 (반복 권장)", stage: "초급", isLiked: false)
]

let levelRunDummyData: [RunModel] = [
    RunModel(title: "자유\n조깅하기", routine: "8주 - 총 27회", stage: "초급", isLiked: false),
    RunModel(title: "초급 달리기\n능력 향상", routine: "2주 - 총 6회 (반복권장)", stage: "초급", isLiked: false),
    RunModel(title: "매일 꾸준히\n달리기", routine: "매일 (반복 권장)", stage: "초급", isLiked: false),
    RunModel(title: "중급 달리기\n능력 향상", routine: "4주 - 초", stage: "중급", isLiked: false),
    RunModel(title: "전속력\n달리기", routine: "8주 - 총 27회", stage: "중급", isLiked: false),
    RunModel(title: "가상\n마라톤", routine: "4주 - 총 12회", stage: "고급", isLiked: false),
]

let personalRunDummyData: [RunModel] = [
    RunModel(title: "거리 달리기\n도전", routine: "4주 - 총 12회", stage: nil, isLiked: false),
    RunModel(title: "시간 달리기\n도전", routine: "2주 - 총 6회 (반복권장)", stage: nil, isLiked: false),
    RunModel(title: "체력 시험\n도전", routine: "매일 (반복 권장)", stage: nil, isLiked: false),
    RunModel(title: "계단 오르기\n도전", routine: "4주 - 총 12회", stage: nil, isLiked: false)
]
