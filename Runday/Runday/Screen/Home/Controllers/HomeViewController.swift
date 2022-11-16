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
    
    final let tabInset: UIEdgeInsets = UIEdgeInsets(top: 0, left: 19, bottom: 0, right: 19)
    final let tabInterItemSpacing: CGFloat = 16
    final let tabCellHeight: CGFloat = 33
    
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
    
    private lazy var tabCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsHorizontalScrollIndicator = false
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()
     
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setLayout()
        register()
    }
    
    //MARK: - Custom Method
    
    private func setLayout(){
        
        view.addSubviews(barView, tabCollectionView)
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
        
        tabCollectionView.snp.makeConstraints {
            $0.top.equalTo(barView.snp.bottom).offset(40)
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(tabCellHeight)
        }
    }
    
    private func register() {
        tabCollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: TabCollectionViewCell.identifier)
    }
    
    //MARK: - Action Method
    
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else {return UICollectionViewCell()}
        
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout
extension HomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - tabInset.right - tabInset.left - tabInterItemSpacing * 3
        
        return CGSize(width: doubleCellWidth/4, height: tabCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return tabInset
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return tabInterItemSpacing
    }
}
