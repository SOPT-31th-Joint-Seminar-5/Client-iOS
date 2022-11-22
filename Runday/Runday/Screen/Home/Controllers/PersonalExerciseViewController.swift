//
//  PersonalExerciseViewController.swift
//  Runday
//
//  Created by 김민 on 2022/11/16.
//

import UIKit

import SnapKit
import Then

// MARK: - PersonalExerciseViewController

class PersonalExerciseViewController: UIViewController {
    
    // MARK: - UI Components
    
    private lazy var personalExerciseCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.showsVerticalScrollIndicator = false
        collectionView.delegate = self
        collectionView.dataSource = self
        
        return collectionView
    }()

    // MARK: - Life Cycles
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        register()
    }
    
    // MARK: - Custom Methods
    
    private func setLayout() {
        view.addSubviews(personalExerciseCollectionView)
        
        personalExerciseCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(calculateHeight())
        }
    }
    
    private func calculateHeight() -> CGFloat {
        let count = CGFloat(3)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        
        return heightCount * Exercise.exerciseCellHeight + (heightCount - 1) * Exercise.exerciseLineSpacing + Exercise.exerciseInset.top + Exercise.exerciseInset.bottom
    }
    
    private func register() {
        personalExerciseCollectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: ExerciseCollectionViewCell.identifier)
    }

}

// MARK: - UICollectionViewDataSource

extension PersonalExerciseViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return personalRunDummyData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath) as? ExerciseCollectionViewCell else {return UICollectionViewCell()}
        
        cell.dataBind(runModel: personalRunDummyData[indexPath.row])
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let runningViewController = RunningViewController()
        navigationController?.pushViewController(runningViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PersonalExerciseViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - Exercise.exerciseInset.left - Exercise.exerciseInset.right - Exercise.exerciseInterItemSpacing
        
        return CGSize(width: doubleCellWidth/2, height: Exercise.exerciseCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return Exercise.exerciseLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return Exercise.exerciseInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return Exercise.exerciseInset
    }
}
