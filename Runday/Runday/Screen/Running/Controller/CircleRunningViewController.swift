//
//  RunningViewController.swift
//  Runday
//
//  Created by 장석우 on 2022/11/14.
//

import UIKit
import SnapKit
import Lottie

//MARK: -  석우도 화이팅!

class CircleRunningViewController : UIViewController{
    
    //MARK: - Properties
    
    private var runningData = RunningModel.sampleData
    private lazy var runningTimer = RunningTimer(runningData)
    
    //MARK: - UI Components
    
    private var timeView : UIView = {
        let view = UIView()
        view.backgroundColor = .rundayWhite
        view.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    private lazy var runProgressView = RunCircleProgressView(runningData)
    
    private let weekDescriptionLabel : UILabel = {
        let label = UILabel()
        label.text = "1주 1회차 안내"
        label.font = .rundayMedium(ofSize: 14)
        label.textColor = .rundayGray5
        return label
    }()
    
    private let voiceAnimationView : LottieAnimationView = {
        let animationView = LottieAnimationView(name: "voice")
        animationView.loopMode = .loop
        return animationView
    }()
    
    private let stepTimerLabel : UILabel = {
        let label = UILabel()
        label.text = "00:00"
        label.font = .rundayRopaMixProExtraBoldItalic(ofSize: 96)
        label.textColor = .rundayBlack
        return label
    }()
    
    private let speedLabel : UILabel = {
        let label = UILabel()
        label.text = "준비 걷기"
        label.textColor = .rundayGray5
        label.font = .rundayBold(ofSize: 32)
        return label
    }()
    
    private lazy var stopButton = makeButton("stop")
    private lazy var previousButton = makeButton("left-shift")
    private lazy var nextButton = makeButton("right-shift")
    
    private lazy var previousStepView = RunCircleStepView(nil)
    private lazy var nextStepView = RunCircleStepView(runningData[1])
    private lazy var gaugeStackView = RunGaugeStackView(runningData: runningData)
    
    private let totalTimerLabel : UILabel = {
        let label = UILabel()
        label.text = "전체 남은 시간 00:00"
        label.font = .rundayMedium(ofSize: 14)
        label.textColor = .rundayGray3
        return label
    }()
    
    private lazy var musicButton = makeButton("music")
    private lazy var lockButton = makeButton("unlock")
    
    private let pageControl : UIPageControl = {
        let pageControl = UIPageControl()
        pageControl.numberOfPages = 3
        pageControl.currentPage = 1
        pageControl.pageIndicatorTintColor = .rundayGray2
        pageControl.currentPageIndicatorTintColor = .rundayGray4
        return pageControl
    }()
    
    //MARK: - Life Cycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setDelegate()
        setUI()
        setLayout()
        addTarget()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewDidAppear(_ animated: Bool) {
        play()
    }

    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        timeView.layer.cornerRadius =  self.view.frame.width / 2
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        runningTimer.delegate = self
    }
    
    private func addTarget(){
        musicButton.addTarget(self, action: #selector(musicButtonDidTapped), for: .touchUpInside)
    }
    
    private func setUI(){
        view.backgroundColor = .rundayGray1
    }
    
    private func play(){
        runningTimer.play()
        voiceAnimationView.play()
    }
    
    private func setLayout(){
        view.addSubviews(
                            previousStepView,
                            nextStepView,
                            timeView,
                            runProgressView,
                            gaugeStackView,
                            totalTimerLabel,
                            musicButton,
                            lockButton,
                            pageControl
                        )
        
        timeView.addSubviews(
                                    weekDescriptionLabel,
                                    voiceAnimationView,
                                    stepTimerLabel,
                                    speedLabel,
                                    stopButton,
                                    previousButton,
                                    nextButton
                            )
        
        
        //MARK: - Root View SubViews Contraints
        
        timeView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview()
            $0.height.equalTo(488.adjusted)
        }
        runProgressView.snp.makeConstraints {
            $0.bottom.equalTo(timeView)
            $0.leading.trailing.equalToSuperview().inset(-3)
            $0.height.equalTo(self.view.frame.width / 2)
        }
        
        
        previousStepView.snp.makeConstraints {
            $0.top.equalTo(timeView.snp.bottom).offset(-12.adjusted)
            $0.leading.equalToSuperview().offset(-12)
            $0.height.equalTo(112.adjusted)
            $0.width.equalTo(112.adjusted)
        }
        
        nextStepView.snp.makeConstraints {
            $0.top.equalTo(timeView.snp.bottom).offset(-12.adjusted)
            $0.trailing.equalToSuperview().offset(12)
            $0.height.equalTo(112.adjusted)
            $0.width.equalTo(112.adjusted)
        }
        
        gaugeStackView.snp.makeConstraints {
            $0.top.equalTo(previousStepView.snp.bottom).offset(55.adjusted)
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.height.equalTo(70.adjusted)
        }
        
        totalTimerLabel.snp.makeConstraints {
            $0.top.equalTo(gaugeStackView.snp.bottom).offset(5.adjusted)
            $0.trailing.equalTo(gaugeStackView)
        }
        
        pageControl.snp.makeConstraints {
            $0.centerY.equalTo(view.snp.bottom).offset(-55.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        musicButton.snp.makeConstraints {
            $0.leading.equalToSuperview().offset(25.adjusted)
            $0.centerY.equalTo(pageControl)
        }
        
        lockButton.snp.makeConstraints {
            $0.trailing.equalToSuperview().offset(-25.adjusted)
            $0.centerY.equalTo(pageControl)
        }
        
                
        //MARK: - TimeView SubViews Contraints
       

        weekDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(54.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        voiceAnimationView.snp.makeConstraints {
            $0.top.equalTo(weekDescriptionLabel.snp.bottom).offset(35.adjusted)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(70)
        }
        
        stepTimerLabel.snp.makeConstraints {
            $0.top.equalTo(voiceAnimationView.snp.bottom).offset(-20.adjusted) //글자가 커서 커스텀
            $0.centerX.equalToSuperview()
        }
        
        speedLabel.snp.makeConstraints {
            $0.top.equalTo(stepTimerLabel.snp.bottom)  //글자가 커서 커스텀
            $0.centerX.equalToSuperview()
        }
        
        stopButton.snp.makeConstraints {
            $0.top.equalTo(speedLabel.snp.bottom).offset(22.adjusted) // 커스텀
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(68)
        }
        
        previousButton.snp.makeConstraints {
            $0.centerY.equalTo(stopButton)
            $0.trailing.equalTo(stopButton.snp.leading).offset(-54.adjusted)
            $0.height.equalTo(24)
        }
        
        nextButton.snp.makeConstraints {
            $0.centerY.equalTo(stopButton)
            $0.leading.equalTo(stopButton.snp.trailing).offset(54.adjusted)
            $0.height.equalTo(24)
        }
    }
    
    private func makeButton(_ imageString: String)-> UIButton{
        let button = UIButton()
        button.setBackgroundImage(UIImage(named: imageString), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }
    
    func getRunningModel(_ index: Int) -> RunningModel?{
        if index < 0 || index >= runningData.count{
            return nil
        } else {
            return runningData[index]
        }
    }
    
    //MARK: - Action Method

    @objc private func musicButtonDidTapped(){
        navigationController?.popViewController(animated: true)
    }
}

//MARK: - RunningTimerDelegate
extension CircleRunningViewController : RunningTimerDelegate{
   
    func secondsChanged(_ stepTime: String,_ totalTime: String) {
        stepTimerLabel.text = stepTime
        totalTimerLabel.text = "전체 남은 시간 \(totalTime)"
    }
    
    func stepChanged(to stepIndex: Int) {
        guard let gaugeView = gaugeStackView.arrangedSubviews[stepIndex] as? RunGaugeView else { return }
        gaugeView.fillRunGaugeView()
        
        let previousData = getRunningModel(stepIndex - 1)
        let currentData = getRunningModel(stepIndex)
        let nextData = getRunningModel(stepIndex + 1)
        
        previousStepView.updateData(previousData)
        speedLabel.text = currentData?.speed.title
        nextStepView.updateData(nextData)
    }
    
    func timeOver() {
        stepTimerLabel.text = "00:00"
        totalTimerLabel.text = "전체 남은 시간 00:00"
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.navigationController?.popViewController(animated: true)
        }
    }
    
    
}
