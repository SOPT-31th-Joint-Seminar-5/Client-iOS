//
//  HomeViewController.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import UIKit

import SnapKit
import Then

//MARK: -  김민 화이팅!!

class HomeViewController : UIViewController {
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    private let barView = UIView()
    private let logoImageView = UIImageView().then {
        $0.image = UIImage(named: "logo-runday")
    }
    
    private let menuButton = UIButton().then {
        $0.setImage(UIImage(named: "hamburger"), for: .normal)
    }
    
    private let noticeButton = UIButton().then {
        $0.setImage(UIImage(named: "notice"), for: .normal)
    }
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setLayout()
    }
    
    //MARK: - Custom Method
    
    private func setLayout(){
        
        view.addSubviews(barView)
        barView.addSubviews(logoImageView, menuButton, noticeButton)
        
        barView.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).offset(21)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(47)
        }
        
        logoImageView.snp.makeConstraints {
            $0.centerX.centerY.equalToSuperview()
            $0.height.equalToSuperview()
        }
        
        menuButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(6)
            $0.leading.equalToSuperview().offset(31)
        }
        
        noticeButton.snp.makeConstraints {
            $0.top.equalToSuperview().offset(2)
            $0.trailing.equalToSuperview().offset(-31)
        }
    }
    
    //MARK: - Action Method
    
}
