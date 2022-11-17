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
    
    var currentPage: Int = 0 {
        didSet {
            setPageView(oldValue: oldValue, newValue: currentPage)
        }
    }
    
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
    
    lazy var myExerciseVC = MyExerciseViewController()
    lazy var levelExerciseVC = LevelExerciseViewController()
    lazy var timeExerciseVC = TimeExerciseViewController()
    lazy var personalExerciseVC = PersonalExerciseViewController()

    lazy var dataViewControllers: [UIViewController] = {
        return [myExerciseVC, levelExerciseVC, timeExerciseVC, personalExerciseVC]
    }()
    
    lazy var pageViewController: UIPageViewController = {
        let vc = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal)
        
        vc.delegate = self
        vc.dataSource = self
        return vc
    }()
     
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
    
        setUI()
        setLayout()
        register()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        currentPage = 0
    }
    
    //MARK: - Custom Method
    
    private func setUI() {
        if let firstVC = dataViewControllers.first {
            pageViewController.setViewControllers([firstVC], direction: .forward, animated: true)
        }
    }
    
    private func setLayout(){
        
        addChild(pageViewController)
        view.addSubviews(barView, tabCollectionView, pageViewController.view)
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
        
        pageViewController.view.snp.makeConstraints {
            $0.top.equalTo(tabCollectionView.snp.bottom)
            $0.leading.trailing.bottom.equalToSuperview()
        }
        
        pageViewController.didMove(toParent: self)
    }
    
    private func register() {
        tabCollectionView.register(TabCollectionViewCell.self, forCellWithReuseIdentifier: TabCollectionViewCell.identifier)
    }
    
    private func setPageView(oldValue: Int, newValue: Int) {
        
        let direction: UIPageViewController.NavigationDirection = oldValue < newValue ? .forward: .reverse
        pageViewController.setViewControllers([dataViewControllers[currentPage]], direction: direction, animated: true)
        
        tabCollectionView.selectItem(at: IndexPath(item: currentPage, section: 0), animated: true, scrollPosition: [])
    }
    
    //MARK: - Action Method
    
}

// MARK: - UICollectionViewDataSource

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tabList.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TabCollectionViewCell.identifier, for: indexPath) as? TabCollectionViewCell else {return UICollectionViewCell()}
        
        if indexPath.row == 0 {
            collectionView.selectItem(at: indexPath, animated: true, scrollPosition: [])
        }
        
        cell.dataBind(tabName: tabList[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TabCollectionViewCell
        cell.toggleSelected()
        currentPage = indexPath.item
    }
    
    func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as! TabCollectionViewCell
        cell.toggleSelected()
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

// MARK: - UIPageViewControllerDataSource, UIPageViewControllerDelegate

extension HomeViewController: UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else {return nil}
        let previousIndex = index - 1
        
        if previousIndex < 0 {
            return nil
        }
        
        return dataViewControllers[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = dataViewControllers.firstIndex(of: viewController) else {return nil}
        let nextIndex = index + 1
        
        if nextIndex == dataViewControllers.count {
            return nil
        }
        
        return dataViewControllers[nextIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, willTransitionTo pendingViewControllers: [UIViewController]) {
        guard let currentVC = pendingViewControllers.first,
              let currentIndex = dataViewControllers.firstIndex(of: currentVC) else {return}
        
        currentPage = currentIndex
    }
}
