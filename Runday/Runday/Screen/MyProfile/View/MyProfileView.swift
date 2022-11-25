//
//  MyProfileView.swift
//  Runday
//
//  Created by 이승헌 on 2022/11/16.
//

import UIKit

final class MyProfileView: UIView {
    var profileData: MyProfileResponseData?
    
    var exerciseModel: ExerciseModel?
    
    
    //MARK: - UI Component
    private let tableViewHeader: UIView = UIView().then {
        $0.backgroundColor = .white
    }
    
    private let profileImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "profile-image")
    }
    
    private let nameView: UIView = UIView().then {
        $0.backgroundColor = .white
    }
    
    public let nameLabel: UILabel = UILabel().then {
        $0.text = "강규태"
        $0.font = .rundayMedium(ofSize: 20)
        $0.sizeToFit()
    }
    
    private let nameEditImageView: UIImageView = UIImageView().then {
        $0.image = UIImage(named: "modify")
    }
    
    private let headerLineView: UIView = UIView().then {
        $0.backgroundColor = .rundayGray7
    }
    
    public lazy var tableView: UITableView = UITableView().then {
        $0.backgroundColor = .clear
        $0.separatorStyle = .none
        $0.tableHeaderView = tableViewHeader
        $0.tableHeaderView?.frame.size.height = 308
        $0.delegate = self
        $0.dataSource = self
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        registerCell()
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
        tableView.tableHeaderView = tableViewHeader
        nameView.addSubviews(nameLabel, nameEditImageView)
        tableViewHeader.addSubviews(
            profileImageView,
            nameView,
            headerLineView
        )
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
        profileImageView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.top.equalToSuperview().inset(94)
        }
        
        nameView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.bottom.equalToSuperview().inset(52)
            $0.width.equalTo(77)
            $0.height.equalTo(21)
        }
        
        nameLabel.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.equalToSuperview()
            $0.height.equalTo(21)
        }
        
        nameEditImageView.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview()
            $0.width.equalTo(16)
            $0.height.equalTo(16)
        }
        
        headerLineView.snp.makeConstraints {
            $0.bottom.equalToSuperview()
            $0.width.equalToSuperview()
            $0.height.equalTo(11)
        }
    }
    
    // MARK: - General Helpers
    
    private func registerCell() {
        tableView.register(ExerciseCell.self, forCellReuseIdentifier: ExerciseCell.identifier)
        tableView.register(BadgeCell.self, forCellReuseIdentifier: BadgeCell.identifier)
        tableView.register(MenuCell.self, forCellReuseIdentifier: MenuCell.identifier)
    }
}

extension MyProfileView: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch indexPath.section {
        case Cell.ExerciseCell.rawValue:
            return 260
        case Cell.BadgeCell.rawValue:
            return 204
        default:
            return 63
        }
    }
}

extension MyProfileView: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case Cell.ExerciseCell.rawValue:
            guard let exerciseCell: ExerciseCell = tableView.dequeueReusableCell(withIdentifier: ExerciseCell.identifier, for: indexPath) as? ExerciseCell else { return UITableViewCell() }
            
            exerciseModel = ExerciseModel(
                time: profileData?.time ?? exerciseDummyData.time,
                distance: profileData?.distance ?? exerciseDummyData.distance,
                pace: profileData?.pace ?? exerciseDummyData.pace,
                calorie: profileData?.calorie ?? exerciseDummyData.calorie
            )
            exerciseCell.dataBind(model: exerciseModel ?? exerciseDummyData)
            return exerciseCell
        case Cell.BadgeCell.rawValue:
            guard let badgeCell: BadgeCell = tableView.dequeueReusableCell(withIdentifier: BadgeCell.identifier, for: indexPath) as? BadgeCell else { return UITableViewCell() }
            
            return badgeCell
        case Cell.MenuCell.rawValue:
            guard let menuCell: MenuCell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return UITableViewCell() }
            
            menuCell.dataBind(model: friendMenu)
            return menuCell
        case Cell.MenuCell.rawValue + 1:
            guard let menuCell: MenuCell = tableView.dequeueReusableCell(withIdentifier: MenuCell.identifier, for: indexPath) as? MenuCell else { return UITableViewCell() }
            
            menuCell.dataBind(model: friendInviteMenu)
            return menuCell
        default:
            return UITableViewCell()
        }
    }
}
