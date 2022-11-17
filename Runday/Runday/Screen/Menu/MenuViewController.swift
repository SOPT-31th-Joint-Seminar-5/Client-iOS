//
//  MenuViewController.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import UIKit
import SnapKit
import Then

//MARK: -  박의서 할수이따~!!

final class MenuViewController : UIViewController{
    
    //MARK: - Properties
    private let storeMenuView = UIView()
    private let helpMenuView = UIView()
    private let officialSiteMenuView = UIView()
    private let settingMenuView = UIView()
    private lazy var etcMenuLeftView = UIStackView(arrangedSubviews: [storeMenuView, officialSiteMenuView]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    private lazy var etcMenuRightView = UIStackView(arrangedSubviews: [helpMenuView, settingMenuView]).then {
        $0.axis = .vertical
        $0.alignment = .fill
        $0.distribution = .equalSpacing
    }
    private let thinVerticalDividingLine = UIView().then {
        $0.backgroundColor = UIColor(r: 247, g: 248, b: 250)
    }
    
    private lazy var previousButton = makeButton("menu-left-shift").then {
        $0.addTarget(self, action: #selector(previousButtonDidTapped), for: .touchUpInside)
    }
    
    private lazy var flagIcon = makeImageView("flag")
    private let marathonLabel = UILabel().then {
        $0.text = "마라톤"
        $0.font = .rundayRegular(ofSize: 20)
        $0.textColor = .rundayBlack
    }
    private let marathonFootLabel = UILabel().then {
        $0.text = "자신의 한계를 넘어 도전해봐요"
        $0.font = .rundayRegular(ofSize: 12)
        $0.textColor = UIColor(r: 129, g: 133, b: 148)
    }
    
    private lazy var noticeLabel = makeLabel("전체 공지")
    private lazy var noticeRightShiftButton = makeButton("menu-right-shift")
    
    private lazy var participatedMarathonLabel = makeLabel("참가한 마라톤")
    private lazy var marathonRightShiftButton = makeButton("menu-right-shift")
    
    private let thinDividingLine = UIView().then {
        $0.backgroundColor = UIColor(r: 247, g: 248, b: 250)
    }
    
    private lazy var infoIcon = makeImageView("info")
    private let infoLabel = UILabel().then {
        $0.text = "운동 정보"
        $0.font = .rundayRegular(ofSize: 20)
        $0.textColor = .rundayBlack
    }
    private let infoFootLabel = UILabel().then {
        $0.text = "더 나은 러닝 라이프를 위해 살펴봐요"
        $0.font = .rundayRegular(ofSize: 12)
        $0.textColor = UIColor(r: 129, g: 133, b: 148)
    }
    
    private lazy var stretchingLabel = makeLabel("스트레칭")
    private lazy var stretchingShiftButton = makeButton("menu-right-shift")
    
    private lazy var muscularExerciseLabel = makeLabel("근력 운동")
    private lazy var muscularExerciseRightShiftButton = makeButton("menu-right-shift")
    
    private lazy var rundayTipLabel = makeLabel("런데이 팁")
    private lazy var rundayTipRightShiftButton = makeButton("menu-right-shift")
    
    private let thickDividingLine = UIView().then {
        $0.backgroundColor = UIColor(r: 247, g: 248, b: 250)
    }
    
    private lazy var storeLabel = makeEctMenuLabel("스토어")
    private lazy var storeRightShiftIcon = makeImageView("menu-etc-right-shift")
    private lazy var helpLabel = makeEctMenuLabel("도움말")
    private lazy var helpRightShiftIcon = makeImageView("menu-etc-right-shift")
    private lazy var officialSiteLabel = makeEctMenuLabel("공식 사이트")
    private lazy var officialSiteRightShiftIcon = makeImageView("menu-etc-right-shift")
    private lazy var settingLabel = makeEctMenuLabel("환경 설정")
    private lazy var settingRightShiftIcon = makeImageView("menu-etc-right-shift")
    
    //MARK: - UI Components
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUI()
        setLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        view.backgroundColor = .rundayWhite
    }
    
    private func setLayout(){
        view.addSubviews(previousButton, flagIcon, marathonLabel, marathonFootLabel, noticeLabel, noticeRightShiftButton, participatedMarathonLabel, marathonRightShiftButton, thinDividingLine, infoIcon, infoLabel, infoFootLabel, stretchingLabel, stretchingShiftButton, muscularExerciseLabel, muscularExerciseRightShiftButton, rundayTipLabel, rundayTipRightShiftButton, thickDividingLine, etcMenuLeftView, thinVerticalDividingLine, etcMenuRightView)
        
        // MARK: - Marathon View Constraints
        previousButton.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide).inset(24)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(23)
            $0.width.equalTo(9)
            $0.height.equalTo(18)
        }
        flagIcon.snp.makeConstraints {
            $0.top.equalTo(previousButton.snp.bottom).offset(46)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(22)
            $0.width.height.equalTo(20)
        }
        marathonLabel.snp.makeConstraints {
            $0.top.equalTo(previousButton.snp.bottom).offset(35)
            $0.leading.equalTo(flagIcon.snp.trailing).offset(20)
        }
        marathonFootLabel.snp.makeConstraints {
            $0.top.equalTo(marathonLabel.snp.bottom).offset(8)
            $0.leading.equalTo(marathonLabel)
        }
        noticeLabel.snp.makeConstraints {
            $0.top.equalTo(marathonFootLabel.snp.bottom).offset(26)
            $0.leading.equalTo(view.safeAreaLayoutGuide).inset(62)
        }
        noticeRightShiftButton.snp.makeConstraints {
            $0.leading.equalTo(noticeLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(noticeLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
        participatedMarathonLabel.snp.makeConstraints {
            $0.top.equalTo(noticeLabel.snp.bottom).offset(36)
            $0.leading.equalTo(noticeLabel)
        }
        marathonRightShiftButton.snp.makeConstraints {
            $0.leading.equalTo(participatedMarathonLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(participatedMarathonLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
        thinDividingLine.snp.makeConstraints {
            $0.top.equalTo(participatedMarathonLabel.snp.bottom).offset(34)
            $0.leading.trailing.equalTo(view.safeAreaLayoutGuide).inset(22)
            $0.height.equalTo(1)
        }
        
        // MARK: - Info View Constraints
        infoIcon.snp.makeConstraints {
            $0.top.equalTo(thinDividingLine.snp.bottom).offset(46)
            $0.leading.equalTo(flagIcon)
            $0.width.height.equalTo(20)
        }
        infoLabel.snp.makeConstraints {
            $0.top.equalTo(thinDividingLine.snp.bottom).offset(37)
            $0.leading.equalTo(marathonLabel)
        }
        infoFootLabel.snp.makeConstraints {
            $0.top.equalTo(infoLabel.snp.bottom).offset(8)
            $0.leading.equalTo(infoLabel)
        }
        stretchingLabel.snp.makeConstraints {
            $0.top.equalTo(infoFootLabel.snp.bottom).offset(26)
            $0.leading.equalTo(infoLabel)
        }
        stretchingShiftButton.snp.makeConstraints {
            $0.leading.equalTo(stretchingLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(stretchingLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
        muscularExerciseLabel.snp.makeConstraints {
            $0.top.equalTo(stretchingLabel.snp.bottom).offset(36)
            $0.leading.equalTo(infoLabel)
        }
        muscularExerciseRightShiftButton.snp.makeConstraints {
            $0.leading.equalTo(muscularExerciseLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(muscularExerciseLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
        rundayTipLabel.snp.makeConstraints {
            $0.top.equalTo(muscularExerciseLabel.snp.bottom).offset(36)
            $0.leading.equalTo(infoLabel)
        }
        rundayTipRightShiftButton.snp.makeConstraints {
            $0.leading.equalTo(rundayTipLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(rundayTipLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(8)
        }
        
        thickDividingLine.snp.makeConstraints {
            $0.top.equalTo(rundayTipRightShiftButton.snp.bottom).offset(56)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(11)
        }
        
        // MARK: - Ect Menu View Constraints
        etcMenuLeftView.snp.makeConstraints {
            $0.top.equalTo(thickDividingLine.snp.bottom).offset(45)
            $0.leading.equalTo(view.safeAreaLayoutGuide)
            $0.trailing.equalTo(view.snp.centerX)
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(31)
        }
        etcMenuRightView.snp.makeConstraints {
            $0.top.bottom.equalTo(etcMenuLeftView)
            $0.leading.equalTo(etcMenuLeftView.snp.trailing)
            $0.trailing.equalTo(view.safeAreaLayoutGuide)
        }
        
        storeMenuView.addSubviews(storeLabel, storeRightShiftIcon)
        storeLabel.snp.makeConstraints {
            $0.top.equalToSuperview().inset(10)
            $0.centerX.equalToSuperview()
        }
        storeRightShiftIcon.snp.makeConstraints {
            $0.centerY.equalTo(storeLabel)
            $0.leading.equalTo(storeLabel.snp.trailing).offset(10)
            $0.width.equalTo(4)
            $0.height.equalTo(7)
        }
        officialSiteMenuView.addSubviews(officialSiteLabel, officialSiteRightShiftIcon)
        officialSiteLabel.snp.makeConstraints {
            $0.bottom.equalToSuperview().inset(15)
            $0.centerX.equalToSuperview()
        }
        officialSiteRightShiftIcon.snp.makeConstraints {
            $0.leading.equalTo(officialSiteLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(officialSiteLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(7)
        }
        
        helpMenuView.addSubviews(helpLabel, helpRightShiftIcon)
        helpLabel.snp.makeConstraints {
            $0.top.equalTo(storeLabel)
            $0.centerX.equalToSuperview()
        }
        helpRightShiftIcon.snp.makeConstraints {
            $0.leading.equalTo(helpLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(helpLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(7)
        }
        settingMenuView.addSubviews(settingLabel, settingRightShiftIcon)
        settingLabel.snp.makeConstraints {
            $0.top.equalTo(officialSiteLabel)
            $0.centerX.equalToSuperview()
        }
        settingRightShiftIcon.snp.makeConstraints {
            $0.leading.equalTo(settingLabel.snp.trailing).offset(10)
            $0.centerY.equalTo(settingLabel)
            $0.width.equalTo(4)
            $0.height.equalTo(7)
        }
        
        thinVerticalDividingLine.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.height.equalTo(etcMenuLeftView)
            $0.width.equalTo(1)
            
        }
    }
    
    private func makeButton(_ imageString: String)-> UIButton{
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: imageString), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }
    
    private func makeImageView(_ imageString: String)-> UIImageView {
        let imageView = UIImageView(image: UIImage(named: imageString))
        return imageView
    }
    
    private func makeLabel(_ textString: String)-> UILabel {
        let label = UILabel()
        label.text = textString
        label.font = .rundayRegular(ofSize: 14)
        label.textColor = UIColor(r: 100, g: 104, b: 119)
        return label
    }
    
    private func makeEctMenuLabel(_ textString: String)-> UILabel {
        let label = UILabel()
        label.text = textString
        label.font = .rundayRegular(ofSize: 16)
        label.textColor = UIColor(r: 30, g: 32, b: 38)
        return label
    }
    
    //MARK: - Action Method
    
    @objc func previousButtonDidTapped(){
        navigationController?.popViewController(animated: true)
    }
    
}
