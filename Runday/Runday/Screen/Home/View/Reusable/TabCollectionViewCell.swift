//
//  TabCollectionViewCell.swift
//  Runday
//
//  Created by 김민 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

// MARK: - TabCollectionViewCell

class TabCollectionViewCell: UICollectionViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "TabCollectionViewCell"

    // MARK: - UI Components
    
    private let tabLabel = UILabel().then {
        $0.text = "나의 운동"
        $0.font = .rundayMedium(ofSize: 16)
        $0.textColor = .rundayGray3
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Custom Method
    
    private func setLayout() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubviews(tabLabel)
        
        tabLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
    }
}
