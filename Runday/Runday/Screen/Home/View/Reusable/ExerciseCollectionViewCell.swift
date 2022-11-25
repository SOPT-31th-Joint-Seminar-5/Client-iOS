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
    
    private let cellImageView = UIImageView().then {
        $0.backgroundColor = .white
        $0.isUserInteractionEnabled = true
    }
    
    private var titleLabel = UILabel().then {
        $0.numberOfLines = 0
        $0.font = .rundayBold(ofSize: 20)
    }
    
    private let routineLabel = UILabel().then {
        $0.textColor = .rundayBlack
        $0.font = .rundayRegular(ofSize: 12)
    }
    
    private let stageLabel = UILabel().then {
        $0.textColor = .rundayBlack
        $0.font = .rundayBold(ofSize: 12)
    }
    
    private let arrowButton = UIButton().then {
        $0.setImage(UIImage(named: "btn-mediumarrow"), for: .normal)
    }
    
    private lazy var likeButton = UIButton().then {
        $0.setImage(UIImage(named: "heart")?.withRenderingMode(.alwaysOriginal), for: .disabled)
        $0.setImage(UIImage(named: "heart.fill")?.withRenderingMode(.alwaysOriginal), for: .normal)
        $0.addTarget(self, action: #selector(heartButtonDidTap), for: .touchUpInside)
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
        
        contentView.addSubviews(cellImageView)
        cellImageView.addSubviews(titleLabel, routineLabel, stageLabel, arrowButton, likeButton)
        
        cellImageView.snp.makeConstraints {
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
        
        likeButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(12)
            $0.bottom.equalToSuperview().offset(-12)
            $0.width.equalTo(14)
            $0.height.equalTo(12)
        }
    }
    
    private func setShadow() {
        cellImageView.layer.masksToBounds = true
        cellImageView.layer.cornerRadius = 10

        layer.masksToBounds = false
        layer.shadowOpacity = 0.5
        layer.shadowColor = UIColor.rundayGray2.cgColor
        layer.shadowOffset = CGSize(width: 0, height: 1)
        layer.shadowRadius = 8
    }
    
    func dataBind(runModel: RunModel, photoModel: RunPhotoModel) {
        cellImageView.image = UIImage(named: photoModel.image)
        titleLabel.text = runModel.title
        routineLabel.text = runModel.routine
        stageLabel.text = runModel.stage
        likeButton.isEnabled = runModel.isLiked
        
        guard let highlight = runModel.highlight else {return}
        titleLabel.attributedText = changeTextColor(text: runModel.title, highlight: highlight)
    }
    
    func levelDataBind(runModel: RunModel, photoModel: RunPhotoModel) {
        cellImageView.image = UIImage(named: photoModel.image)
        titleLabel.text = runModel.title
        routineLabel.text = runModel.routine
        stageLabel.text = runModel.stage
        
        stageLabel.textColor = .rundayBlue
    }
    
    @objc
    private func heartButtonDidTap() {
        likeButton.isSelected.toggle()
        if likeButton.isSelected {
            likeButton.isSelected = false
        } else {
            likeButton.isSelected = true
        }
    }
    
    func changeTextColor(text: String, highlight: String) -> NSAttributedString {
        let attributtedString = NSMutableAttributedString(string: text)
        attributtedString.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.rundayBlue, range: (text as NSString).range(of: highlight))

        return attributtedString
    }
}
