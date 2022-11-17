//
//  ProfileTableViewCell.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import UIKit

class ExerciseCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ExerciseCell"

    // MARK: - UI Components
    
    private let feedImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "feed")
    }
    
    private let feedLabel: UILabel = UILabel().then {
        $0.text = "운동 피드"
        $0.font = .rundayRegular(ofSize: 16)
        $0.textColor = .rundayBlack1
    }
    
    private let rightShiftImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "right-shift")
    }
    
    private let timeLabel: UILabel = UILabel().then {
        $0.text = "시간"
        $0.font = .rundayRegular(ofSize: 12)
        $0.textColor = .rundayGray6
    }
    
    private let timeDataLabel: UILabel = UILabel().then {
        $0.text = "00:00"
        $0.font = .rundayMedium(ofSize: 20)
    }
    
    private let distanceLabel: UILabel = UILabel().then {
        $0.text = "거리"
        $0.font = .rundayRegular(ofSize: 12)
        $0.textColor = .rundayGray6
    }
    
    private let distanceDataLabel: UILabel = UILabel().then {
        $0.text = "00.00km"
        $0.font = .rundayMedium(ofSize: 20)
    }
    
    private let paceLabel: UILabel = UILabel().then {
        $0.text = "페이스"
        $0.font = .rundayRegular(ofSize: 12)
        $0.textColor = .rundayGray6
    }
    
    private let paceDataLabel: UILabel = UILabel().then {
        $0.text = "0km/h"
        $0.font = .rundayMedium(ofSize: 20)
    }
    
    private let calorieLabel: UILabel = UILabel().then {
        $0.text = "칼로리"
        $0.font = .rundayRegular(ofSize: 12)
        $0.textColor = .rundayGray6
    }
    
    private let calorieDataLabel: UILabel = UILabel().then {
        $0.text = "0kcal"
        $0.font = .rundayMedium(ofSize: 20)
    }
    
    private let dateLabel: UILabel = UILabel().then {
        let dateFormatter: DateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy년 MM월 dd일 HH:mm"
        $0.text = dateFormatter.string(from: Date())
        $0.font = .rundayRegular(ofSize: 12)
        $0.textColor = .rundayGray6
    }
    
    // MARK: - LifeCycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.selectionStyle = .none
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - General Helpers
    
    func dataBind(model: ExerciseModel) {
        timeDataLabel.text = model.time
        distanceDataLabel.text = model.distance
        paceDataLabel.text = model.pace
        calorieDataLabel.text = model.calorie
    }
}

extension ExerciseCell {
    private func setLayout() {
        self.addSubviews(
            feedImage,
            feedLabel,
            rightShiftImageView,
            timeLabel,
            timeDataLabel,
            distanceLabel,
            distanceDataLabel,
            paceLabel,
            paceDataLabel,
            calorieLabel,
            calorieDataLabel,
            dateLabel
        )
        
        feedImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(33)
            $0.leading.equalToSuperview().inset(22)
        }
        
        feedLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(33)
            $0.leading.equalTo(feedImage.snp.trailing).offset(20)
            $0.height.equalTo(21)
        }
        
        rightShiftImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalTo(feedLabel.snp.trailing).offset(10)
            $0.width.equalTo(4)
            $0.height.equalTo(7)
        }
        
        timeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(115)
            $0.leading.equalToSuperview().inset(90)
            $0.height.equalTo(21)
        }
        
        timeDataLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(89)
            $0.leading.equalToSuperview().inset(72)
            $0.height.equalTo(21)
        }
        
        distanceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(115)
            $0.trailing.equalToSuperview().inset(106)
            $0.height.equalTo(21)
        }
        
        distanceDataLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(89)
            $0.trailing.equalToSuperview().inset(72)
            $0.height.equalTo(21)
        }
        
        paceLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(182)
            $0.leading.equalTo(85)
            $0.height.equalTo(21)
        }
        
        paceDataLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(156)
            $0.leading.equalToSuperview().inset(68)
            $0.height.equalTo(21)
        }
        
        calorieLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(182)
            $0.trailing.equalToSuperview().inset(100)
            $0.height.equalTo(21)
        }
        
        calorieDataLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(156)
            $0.trailing.equalToSuperview().inset(77)
            $0.height.equalTo(21)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(229)
            $0.trailing.equalToSuperview().inset(21)
        }
    }
}
