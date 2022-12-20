//
//  MyExerciseViewController.swift
//  Runday
//
//  Created by 김민 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

// MARK: - MyExerciseViewController

class MyExerciseViewController: BaseHomeViewController {
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
}

// MARK: - UICollectionViewDataSource

extension MyExerciseViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return myRunDummyData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath) as? ExerciseCollectionViewCell else {return UICollectionViewCell()}
        
        cell.dataBind(runModel: myRunDummyData[indexPath.row], photoModel: myPhotoDummyData[indexPath.row])
        return cell
    }
}

