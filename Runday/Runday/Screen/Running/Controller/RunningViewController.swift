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

class RunningViewController : UIViewController{
    
    //MARK: - Properties
    
    var totalTime : Float = 10{
        didSet{
            runningTimer = RunningTimer(second: totalTime)
        }
    }
    var timer : Timer?
    lazy var runningTimer = RunningTimer(second: totalTime)
    
    //MARK: - UI Components
    
    private let timeSuperView : UIView = {
        let view = UIView()
        view.backgroundColor = .clear
        view.layer.cornerRadius = 60
        view.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        return view
    }()
    
    private let timeAlphaView : UIView = {
        let view = UIView()
        view.backgroundColor = .rundayWhite
        view.alpha = 0.8                //커스텀: 생각보다 투명해서 0.6 -> 0.8
        view.layer.cornerRadius = 60
        view.layer.maskedCorners = [ .layerMinXMaxYCorner, .layerMaxXMaxYCorner]
        view.layer.shadowColor = UIColor.rundayGray5.cgColor
        view.layer.shadowRadius = 5
        view.layer.shadowOffset = CGSize(width: 0, height: 11)
        view.layer.shadowOpacity = 0.15
        return view
    }()
    
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
    
    private let timerLabel : UILabel = {
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
    
    private let progressView : UIProgressView = {
        let progressView = UIProgressView()
        progressView.tintColor = .rundayBlue
        return progressView
    }()
    
    private lazy var stopButton = makeButton("stop")
    private lazy var previousButton = makeButton("left-shift")
    private lazy var nextButton = makeButton("right-shift")
    
    private let previousStepView = RunStepView.previous(period: "03:00", speed: .slowRun).build()
    private let nextStepView = RunStepView.next(period: "01:00", speed: .fastRun).build()
    
    private lazy var gaugeStackView = makeRunGaugeStackViews(speeds:
                                                                    .walk,
                                                                    .fastRun,
                                                                    .slowRun,
                                                                    .fastRun,
                                                                    .slowRun,
                                                                    .fastRun,
                                                                    .slowRun,
                                                                    .fastRun,
                                                                    .slowRun,
                                                                    .fastRun,
                                                                    .walk
                                                             )
    private let leftTimerLabel : UILabel = {
        let label = UILabel()
        label.text = "전체 남은 시간 22:58"
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
        playAnimation()
        playTimer()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = true
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        tabBarController?.tabBar.isHidden = false
    }
    
    //MARK: - Custom Method
    
    private func setDelegate(){
        runningTimer.delegate = self
    }
    
    private func setUI(){
        view.backgroundColor = .rundayGray1
        
    }
    
    private func playAnimation(){
        voiceAnimationView.play()
    }
    
    private func playTimer(){
        timer = Timer.scheduledTimer(timeInterval: 0.05,
                                     target: self,
                                     selector: #selector(decreaseRunningTimer),
                                     userInfo: nil,
                                     repeats: true)
    }
    
    private func setLayout(){
        view.addSubviews(
                            previousStepView,
                            nextStepView,
                            timeSuperView,
                            gaugeStackView,
                            leftTimerLabel,
                            musicButton,
                            lockButton,
                            pageControl
                        )
        timeSuperView.addSubview(timeAlphaView)
        timeSuperView.addSubviews(
                                    weekDescriptionLabel,
                                    voiceAnimationView,
                                    timerLabel,
                                    speedLabel,
                                    progressView,
                                    stopButton,
                                    previousButton,
                                    nextButton
                                  )
        
        //MARK: - Root View SubViews Contraints
    
        timeSuperView.snp.makeConstraints {
            $0.top.equalToSuperview()
            $0.leading.trailing.equalToSuperview().inset(10.adjusted)
            $0.height.equalTo(464.adjusted)
        }
        
        previousStepView.snp.makeConstraints {
            $0.top.equalTo(timeSuperView.snp.bottom).offset(-42.adjusted)
            $0.leading.equalToSuperview()
            $0.height.equalTo(157.adjusted)
            $0.width.equalTo(140.adjusted)
        }
        
        nextStepView.snp.makeConstraints {
            $0.top.equalTo(timeSuperView.snp.bottom).offset(-42.adjusted)
            $0.trailing.equalToSuperview()
            $0.height.equalTo(157.adjusted)
            $0.width.equalTo(140.adjusted)
        }
        
        gaugeStackView.snp.makeConstraints {
            $0.top.equalTo(previousStepView.snp.bottom).offset(60.adjusted)
            $0.leading.trailing.equalToSuperview().inset(20.adjusted)
            $0.height.equalTo(70.adjusted)
        }
        
        leftTimerLabel.snp.makeConstraints {
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
        
                
        //MARK: - TimeSuperView SubViews Contraints
        timeAlphaView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }

        weekDescriptionLabel.snp.makeConstraints {
            $0.top.equalToSuperview().offset(54.adjusted)
            $0.centerX.equalToSuperview()
        }
        
        voiceAnimationView.snp.makeConstraints {
            $0.top.equalTo(weekDescriptionLabel.snp.bottom).offset(35.adjusted)
            $0.centerX.equalToSuperview()
            $0.height.width.equalTo(70)
        }
        
        timerLabel.snp.makeConstraints {
            $0.top.equalTo(voiceAnimationView.snp.bottom).offset(-20.adjusted) //글자가 커서 커스텀
            $0.centerX.equalToSuperview()
        }
        
        speedLabel.snp.makeConstraints {
            $0.top.equalTo(timerLabel.snp.bottom).offset(-10.adjusted)  //글자가 커서 커스텀
            $0.centerX.equalToSuperview()
        }
        
        progressView.snp.makeConstraints {
            $0.top.equalTo(speedLabel.snp.bottom).offset(49.adjusted)
            $0.leading.trailing.equalToSuperview().inset(41.adjusted)
            $0.height.equalTo(7.adjusted)
        }
        
        stopButton.snp.makeConstraints {
            $0.top.equalTo(progressView.snp.bottom).offset(15.adjusted) // 커스텀
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
    
    private func makeRunGaugeStackViews(speeds: Speed...) -> UIStackView{
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .bottom
        stackView.spacing = 2
        
        for speed in speeds{
            let gaugeView = speed.makeRunGaugeView()
            stackView.addArrangedSubview(gaugeView)
        }
        
        return stackView
    }
    
    //MARK: - Action Method
    
    @objc func decreaseRunningTimer(){
        do {
            try runningTimer.decreaseTime(0.05)
        } catch {
            // 시간초과 발생시 타이머 중지 및 label 0초로 초기화.
            timer?.invalidate()
            timerLabel.text = "00:00"
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.navigationController?.popViewController(animated: true)
            }
        }
        
        progressView.progress = runningTimer.ratio
        
    }
    
}

//MARK: - RunningTimerDelegate
extension RunningViewController : RunningTimerDelegate{
    func secondsChange(_ timeString: String) {
        print(timeString)
        timerLabel.text = timeString
    }
    
    
}
