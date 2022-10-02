//
//  FirstViewController.swift
//  BMI
//
//  Created by 이주환 on 2022/09/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: pravate var & let Outlet
    var bmi: BMI?
    
    private let firstViewUI = FirstViewUI()
    
    override func loadView() {
        // super.loadView() 필요없음
        view = firstViewUI
    }
    
    //MARK: view cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let val: BMI = bmi else { return }
        
        view.backgroundColor = .white
        firstViewUI.Backbutton.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        firstViewUI.mainLabel.backgroundColor = bmi?.backColor
        firstViewUI.mainLabel.text = String(val.value)
        firstViewUI.secondLabel.text = bmi?.string
        
    }
    
    //MARK: btn method
    @objc func backBtnTouch(){
        dismiss(animated: true)
        
    }
}
