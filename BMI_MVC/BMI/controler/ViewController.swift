//
//  ViewController.swift
//  BMI
//
//  Created by 이주환 on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {

    private let viewUI = ViewUI()
    
    var bmiManeger = BMIManeger()
    
    override func loadView() {
        // super.loadView() 필요없음
        view = viewUI
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        setUp()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        viewUI.button.addTarget(self, action: #selector(bmiBtnTouch), for: .touchUpInside)
    }

    
    @objc func bmiBtnTouch(){
        let firstVC = FirstViewController()
        
        
        firstVC.bmi = bmiManeger.getBMI(w: viewUI.weightTf.text!, h: viewUI.heightTf.text!)
        
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true)
        
        viewUI.heightTf.text = ""
        viewUI.weightTf.text = ""
    }

}


    

        
    


