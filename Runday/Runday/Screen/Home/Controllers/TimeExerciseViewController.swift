//
//  TimeExerciseViewController.swift
//  Runday
//
//  Created by 김민 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

// MARK: - TimeExerciseViewController

class TimeExerciseViewController: BaseHomeViewController {
    
    // MARK: - Variables
    
    var runList: [RunModel] = []
    
    // MARK: - Life Cycles
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
         fetchRunList()
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    // MARK: - Custom Methods
    
    private func fetchRunList() {
        TimeExerciseAPI.shared.getTimeExercise(for: CommonRequestDTO(runId: 1)) { data in
            if let runList = data {
                var list: [RunModel] = []
                
                for run in runList {
                    list.append(run.convertToRunList())
                }
                self.runList = list
            }
            self.exerciseCollectionView.reloadData()
        }
    }
}

// MARK: - UICollectionViewDataSource

extension TimeExerciseViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return runList.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath) as? ExerciseCollectionViewCell else {return UICollectionViewCell()}
        
        cell.dataBind(runModel: runList[indexPath.item], photoModel: timePhotoDummyData[indexPath.row])
        return cell
    }
}

// MARK: - Network

extension TimeExerciseViewController {
    func like() {
        LikeAPI.shared.putLike(for: CommonRequestDTO(runId: 1)) { data in
        }
    }
    
    func disLike() {
        LikeAPI.shared.putDislike(for: CommonRequestDTO(runId: 1)) { data in
        }
    }
}
