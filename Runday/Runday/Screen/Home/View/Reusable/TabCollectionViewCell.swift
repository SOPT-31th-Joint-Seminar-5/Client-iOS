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
        $0.font = .rundayMedium(ofSize: 16)
        $0.textColor = .rundayGray3
    }
    
    private let indicatorView = UIView().then {
        $0.backgroundColor = .rundayBlack
        $0.isHidden = true
    }
    
    // MARK: - Life Cycles
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - Properties

    override var isSelected: Bool {
        didSet {
            indicatorView.isHidden = isSelected ? false : true
            tabLabel.textColor = isSelected ? .rundayBlack : .rundayGray3
        }
    }
    
    // MARK: - Custom Method
    
    private func setLayout() {
        
        backgroundColor = .clear
        contentView.backgroundColor = .clear
        
        contentView.addSubviews(tabLabel, indicatorView)
        
        tabLabel.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
        }
        
        indicatorView.snp.makeConstraints {
            $0.top.equalTo(tabLabel.snp.bottom).offset(6)
            $0.height.equalTo(2)
            $0.leading.equalToSuperview().offset(6)
            $0.trailing.equalToSuperview().offset(-5)
            $0.bottom.equalToSuperview()
        }
    }
    
    func dataBind(tabName: String) {
        tabLabel.text = tabName
    }
    
    
    func toggleSelected() {
        if isSelected {
            indicatorView.isHidden = false
            tabLabel.textColor = .rundayBlack
        } else {
            indicatorView.isHidden = true
            tabLabel.textColor = .rundayGray3
        }
    }
}
