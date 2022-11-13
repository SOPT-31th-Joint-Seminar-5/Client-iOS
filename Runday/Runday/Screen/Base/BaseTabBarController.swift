//
//  ViewController.swift
//  Runday
//
//  Created by 장석우 on 2022/11/12.
//

import UIKit

class BaseTabBarController: UITabBarController {

    let homeNVC = BaseNavigationController(rootViewController: HomeViewController())
    let historyNVC = BaseNavigationController(rootViewController: UIViewController())
    let crewNVC = BaseNavigationController(rootViewController: UIViewController())
    let challengeNVC = BaseNavigationController(rootViewController: UIViewController())
    let myProfileNVC = BaseNavigationController(rootViewController: MyProfileViewController())
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
        setViewController()
       
    }
    
    override func viewDidLayoutSubviews() {
        tabBar.frame.size.height = 90
        tabBar.frame.origin.y = view.frame.height - 90
    }
    
    //MARK: - Custom Method
    
    private func setUI(){
        tabBar.backgroundColor = .white
        tabBar.tintColor = .rundayBlue
    }
    
    private func setViewController(){
        
        homeNVC.tabBarItem = UITabBarItem(title: "홈",
                                           image: UIImage(named: "home"),
                                           selectedImage: UIImage(named: "home.fill"))
        
        historyNVC.tabBarItem = UITabBarItem(title: "기록",
                                         image: UIImage(named: "history"),
                                         selectedImage: UIImage(systemName: "history.fill"))
        
        crewNVC.tabBarItem = UITabBarItem(title: "크루",
                                         image: UIImage(named: "ccrew"),
                                         selectedImage: UIImage(named: "crew.fill"))
        
        challengeNVC.tabBarItem = UITabBarItem(title: "챌린지",
                                         image: UIImage(named: "challenge"),
                                         selectedImage: UIImage(named: "challenge.fill"))
        
        myProfileNVC.tabBarItem = UITabBarItem(title: "My메뉴",
                                         image: UIImage(named: "profile"),
                                         selectedImage: UIImage(named: "profile.fill"))
        
        viewControllers = [homeNVC,historyNVC,crewNVC,challengeNVC,myProfileNVC]
    }

}

