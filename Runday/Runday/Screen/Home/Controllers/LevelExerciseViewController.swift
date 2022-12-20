//
//  LevelExerciseViewController.swift
//  Runday
//
//  Created by 김민 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

// MARK: - LavelExerciseViewController

class LevelExerciseViewController: BaseHomeViewController {
    
    // MARK: - Life Cycles

    override func viewDidLoad() {
        super.viewDidLoad()

    }
}

// MARK: - UICollectionViewDataSource

extension LevelExerciseViewController {
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return levelRunDummyData.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath) as? ExerciseCollectionViewCell else {return UICollectionViewCell()}
        
        cell.levelDataBind(runModel: levelRunDummyData[indexPath.row], photoModel: levelPhotoDummyData[indexPath.row])
        return cell
    }
}

