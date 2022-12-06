//
//  BaseHomeViewController.swift
//  Runday
//
//  Created by 김민 on 2022/12/06.
//

import UIKit

// MARK: - BaseHomeViewController

class BaseHomeViewController: UIViewController {
    
    // MARK: - Constant
    
    final let exerciseInset: UIEdgeInsets = UIEdgeInsets(top: 20, left: 16, bottom: 20, right: 16)
    final let exerciseLineSpacing: CGFloat = 12
    final let exerciseInterItemSpacing: CGFloat = 6
    final let exerciseCellHeight: CGFloat = 240
    
    // MARK: - UI Components
    
    lazy var exerciseCollectionView: UICollectionView = {
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
    
    // MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setLayout()
        register()
    }
    
    // MARK: - Custom Method
    
    private func setLayout() {
        view.addSubviews(exerciseCollectionView)
        
        exerciseCollectionView.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(view.safeAreaLayoutGuide)
            $0.height.equalTo(calculateHeight())
        }
    }
    
    private func calculateHeight() -> CGFloat {
        let count = CGFloat(3)
        let heightCount = count / 2 + count.truncatingRemainder(dividingBy: 2)
        
        return heightCount * exerciseCellHeight + (heightCount - 1) * exerciseLineSpacing + exerciseInset.top + exerciseInset.bottom
    }
    
    private func register() {
        exerciseCollectionView.register(ExerciseCollectionViewCell.self, forCellWithReuseIdentifier: ExerciseCollectionViewCell.identifier)
    }
}

// MARK: - UICollectionViewDataSource

extension BaseHomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ExerciseCollectionViewCell.identifier, for: indexPath) as? ExerciseCollectionViewCell else {return UICollectionViewCell()}

        return cell
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let runningViewController = CircleRunningViewController()
        navigationController?.pushViewController(runningViewController, animated: true)
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension BaseHomeViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let screenWidth = UIScreen.main.bounds.width
        let doubleCellWidth = screenWidth - exerciseInset.left - exerciseInset.right - exerciseInterItemSpacing
        
        return CGSize(width: doubleCellWidth/2, height: exerciseCellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return exerciseLineSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return exerciseInterItemSpacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return exerciseInset
    }
}
