//
//  RunCardCollectionViewCell.swift
//  Runday
//
//  Created by 김민 on 2022/11/17.
//

import UIKit

import SnapKit
import Then

// MARK: - RunCardCollectionViewCell

class ExerciseCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ExerciseCollectionViewCell"
    
    // MARK: - UI Components
    
    private let cellView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .rundayBold(ofSize: 20)
        $0.text = "테스트\n임니다"
    }
    
    private let routineLabel = UILabel().then {
        $0.textColor = .rundayBlack
        $0.font = .rundayRegular(ofSize: 12)
        $0.text = "기간"
    }
    
    private let stageLabel = UILabel().then {
        $0.textColor = .rundayBlack
        $0.font = .rundayBold(ofSize: 12)
        $0.text = "초급"
    }
    
    private let arrowButton = UIButton().then {
        $0.setImage(UIImage(named: "btn-mediumarrow"), for: .normal)
    }
    
    private let heartButton = UIButton().then {
        $0.setImage(UIImage(named: "heart"), for: .normal)
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setUI() {
        setShadow()
    }
    
    private func setLayout() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubviews(cellView)
        cellView.addSubviews(titleLabel, routineLabel, stageLabel, arrowButton, heartButton)
        
        cellView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(13)
        }
        
        routineLabel.snp.makeConstraints {
            $0.top.equalTo(titleLabel.snp.bottom).offset(6)
            $0.leading.equalTo(titleLabel)
        }
        
        stageLabel.snp.makeConstraints {
            $0.top.equalTo(routineLabel.snp.bottom)
            $0.leading.equalTo(titleLabel)
        }
        
        arrowButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(18)
            $0.trailing.equalToSuperview().offset(-18)
            $0.width.equalTo(6)
            $0.height.equalTo(12)
        }
        
        heartButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.width.equalTo(14)
            $0.height.equalTo(12)
        }
    }
    
    private func setShadow() {
        cellView.layer.masksToBounds = true
        cellView.layer.cornerRadius = 10

        layer.masksToBounds = false
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.rundayGray2.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 8
    }
    
}
