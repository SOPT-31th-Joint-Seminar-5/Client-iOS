//
//  ProfileTableViewCell.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import UIKit

class ProfileTableViewCell: UITableViewCell {
    
    // MARK: - Identifier
    
    static let identifier = "ProfileTableViewCell"

    // MARK: - UI Components
    
    // MARK: - LifeCycles
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ProfileTableViewCell {
    private func setLayout() {
        
    }
}
