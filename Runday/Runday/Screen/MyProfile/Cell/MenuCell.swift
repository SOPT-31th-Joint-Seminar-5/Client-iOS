//
//  MenuCell.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import UIKit

class MenuCell: UITableViewCell {

    // MARK: - Identifier
    
    static let identifier = "MenuCell"

    // MARK: - UI Components
    
    private var menuImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "friend")
    }
    
    private var menuLabel: UILabel = UILabel().then {
        $0.text = "친구 관리"
        $0.font = .rundayRegular(ofSize: 16)
        $0.textColor = .rundayBlack1
    }
    
    private var rightShiftImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "right-shift")
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
    
    func dataBind(model: MenuModel) {
        menuImageView.image = UIImage(named: model.image)
        menuLabel.text = model.content
        rightShiftImageView.image = UIImage(named: model.swiftImage)
    }
}

extension MenuCell {
    private func setLayout() {
        self.addSubviews(
            menuImageView,
            menuLabel,
            rightShiftImageView
        )
        
        menuImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(38)
            $0.leading.equalToSuperview().inset(22)
        }
        
        menuLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(34)
            $0.leading.equalTo(menuImageView.snp.trailing).offset(20)
            $0.height.equalTo(21)
        }
        
        rightShiftImageView.snp.makeConstraints {
            $0.top.equalToSuperview().inset(41)
            $0.leading.equalTo(menuLabel.snp.trailing).offset(10)
            $0.width.equalTo(4)
            $0.height.equalTo(7)
        }
    }
}
