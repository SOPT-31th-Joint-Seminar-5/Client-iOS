//
//  CrewViewController.swift
//  Runday
//
//  Created by 장석우 on 2022/11/22.
//

import UIKit
import SnapKit

class CrewViewController : UIViewController{
    
    //MARK: - Properties
    
    private lazy var timeExerciseButton: UIButton = {
        let button = UIButton()
        button.setTitle("시간 운동 API Test", for: .normal)
        button.backgroundColor = .rundayBlue
        button.layer.cornerRadius = 10
        button.tag = 0
        button.addTarget(self, action: #selector(apiTestButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var likeButton: UIButton = {
        let button = UIButton()
        button.setTitle("좋아요 API Test", for: .normal)
        button.backgroundColor = .rundayBlue
        button.layer.cornerRadius = 10
        button.tag = 1
        button.addTarget(self, action: #selector(apiTestButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var disLikeButton: UIButton = {
        let button = UIButton()
        button.setTitle("안좋아요 API Test", for: .normal)
        button.backgroundColor = .rundayBlue
        button.layer.cornerRadius = 10
        button.tag = 2
        button.addTarget(self, action: #selector(apiTestButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var myProfileButton: UIButton = {
        let button = UIButton()
        button.setTitle("내 프로필 API Test", for: .normal)
        button.backgroundColor = .rundayBlue
        button.layer.cornerRadius = 10
        button.tag = 3
        button.addTarget(self, action: #selector(apiTestButtonDidTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var vStackView = UIStackView(arrangedSubviews: [timeExerciseButton,likeButton,disLikeButton,myProfileButton]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.spacing = 10
        $0.distribution = .fillEqually
    }
    
    //MARK: - UI Components
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setLayout()
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        
    }
    
    private func setLayout(){
        view.addSubview(vStackView)
        
        vStackView.snp.makeConstraints {
            $0.top.equalToSuperview().offset(250)
            $0.leading.trailing.equalToSuperview().inset(70)
            $0.bottom.equalToSuperview().offset(-250)
        }
        
    }
    
    //MARK: - Action Method
    
    @objc func apiTestButtonDidTapped(_ sender: UIButton){
        switch sender.tag{
        case 0:
            TimeExerciseAPI.shared.getTimeExercise(for: CommonRequestDTO(runId: 1)) { data in
                print(data)
            }
        case 1:
            LikeAPI.shared.putLike(for: CommonRequestDTO(runId: 1)) { data in
                print(data)
            }
        case 2:
            LikeAPI.shared.putDislike(for: CommonRequestDTO(runId: 1)) { data in
                print(data)
            }
        case 3:
            MyProfileAPI.shared.getMyProfile { data in
                print(data)
            }
        default: print("런데이 화이팅!")
        }
        
    }
}
