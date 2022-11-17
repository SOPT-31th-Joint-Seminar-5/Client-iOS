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
    
    private let testView = UIView().then {
        $0.backgroundColor = .yellow
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
        
        contentView.addSubviews(testView)
        
        testView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
}
