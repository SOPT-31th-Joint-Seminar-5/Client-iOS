//
//  MyProfileViewController.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import UIKit
import SnapKit
import Moya

//MARK: -  승헌이형 가보즈아~

class MyProfileViewController : UIViewController{
    
    var myProfileView: MyProfileView = MyProfileView()
    var profileResponse: MyProfileResponseData?
    
    //MARK: - Properties
    
    //MARK: - UI Components
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setUI()
    }
    
    override func loadView() {
        super.loadView()
        
        myProfileView = MyProfileView(frame: self.view.frame)
        self.view = myProfileView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        getMyProfileData()
    }
    
    //MARK: - Action Method
    

}

extension MyProfileViewController {
    //MARK: - Custom Method
    private func setUI() {
        view.backgroundColor = .white
    }
    
    private func getMyProfileData() {
        MyProfileAPI.shared.getMyProfile() { data in
            
            if let data = data {
                DispatchQueue.main.async {
                    self.myProfileView.nameLabel.text = data.name
                    self.myProfileView.profileData = data
                }
            }
        }
    }
}
