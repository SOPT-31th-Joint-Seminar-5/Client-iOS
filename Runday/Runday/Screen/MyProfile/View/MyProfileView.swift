//
//  MyProfileView.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import UIKit

final class MyProfileView: UIView {
    
    //MARK: - Views
    var tableView: UITableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.delegate = self
        $0.dataSource = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension MyProfileView {
    private func setUI() {
        self.backgroundColor = .white
    }
    
    private func setLayout() {
        self.addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
