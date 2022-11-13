//
//  BaseNavigationController.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import UIKit

class BaseNavigationController : UINavigationController{
    
    //MARK: - Properties
    
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNavigationBarHidden(true, animated: true)
        view.backgroundColor = .white
    }
    
    //MARK: - Custom Method
    
    
}
