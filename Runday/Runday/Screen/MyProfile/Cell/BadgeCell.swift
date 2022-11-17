//
//  BadgeCell.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import UIKit

class BadgeCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "BadgeCell"

    // MARK: - UI Components
    
    private let badgeImage: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "badge")
    }
    
    private let badgeLabel: UILabel = UILabel().then {
        $0.text = "수집한 배지"
        $0.font = .rundayRegular(ofSize: 16)
        $0.textColor = .rundayBlack1
    }
    
    private let rightShiftImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "right-shift")
    }
    
    private let badgeOneImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "badgeOne")
    }
    
    private let badgeTwoImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "badgeTwo")
    }
    
    private let badgeThreeImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "badgeThree")
    }
    
    private let badgeFourImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "badgeFour")
    }
    
    private let dateLabel: UILabel = UILabel().then {
        $0.text = "최근 획득한 배지"
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
}

extension BadgeCell {
    private func setLayout() {
        self.addSubviews(
            badgeImage,
            badgeLabel,
            rightShiftImageView,
            dateLabel,
            badgeOneImageView,
            badgeTwoImageView,
            badgeThreeImageView,
            badgeFourImageView
        )
        
        badgeImage.snp.makeConstraints {
            $0.top.equalToSuperview().inset(33)
            $0.leading.equalToSuperview().inset(22)
        }
        
        badgeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(33)
            $0.leading.equalTo(badgeImage.snp.trailing).offset(20)
            $0.height.equalTo(21)
        }
        
        rightShiftImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(40)
            $0.leading.equalTo(badgeLabel.snp.trailing).offset(10)
            $0.width.equalTo(4)
            $0.height.equalTo(7)
        }
        
        dateLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(169)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        badgeOneImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(91)
            $0.leading.equalToSuperview().inset(47)
        }
        
        badgeTwoImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(91)
            $0.leading.equalTo(badgeOneImageView.snp.trailing).offset(37)
        }
        
        badgeThreeImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(91)
            $0.leading.equalTo(badgeTwoImageView.snp.trailing).offset(37)
        }
        
        badgeFourImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(91)
            $0.leading.equalTo(badgeThreeImageView.snp.trailing).offset(37)
        }
    }
}
