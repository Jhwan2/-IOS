//
//  ViewController.swift
//  FirstNewApp
//
//  Created by 이주환 on 2022/09/19.
//

import UIKit
import AVFoundation


class ViewController: UIViewController {

    @IBOutlet weak var secLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    weak var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initSetting()
    }
    
    func initSetting(){
        self.slider.minimumValue = 0.0
        self.slider.maximumValue = 60.0
        slider.value = 30.0
    }
    
    @IBAction func sliderChanged(_ sender: UISlider){
        let sec = String(Int(sender.value))
        self.secLabel.text = sec + " 초"
    }

    @IBAction func resetPushBtn(_ sender: UIButton) {
        secLabel.text = "초를 선택하세요"
        slider.value = 30.0
        timer?.invalidate()
    }
    
    @IBAction func startPushBtn(_ sender: UIButton) {
        // 초가 지날수록 슬라이더의 위치가 변한다
        // 이것을 레이블에 표시
        timer?.invalidate()
        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true) { [self] _ in
            
            if slider.value > 0 {
                slider.value -= 1
                secLabel.text = "\(Int(slider.value)) 초"
            } else {
                secLabel.text = "시간 종료"
                timer?.invalidate()
                AudioServicesPlayAlertSound(SystemSoundID(1322))
            }
        }
        
    }
    
    
}

