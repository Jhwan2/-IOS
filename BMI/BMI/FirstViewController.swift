//
//  FirstViewController.swift
//  BMI
//
//  Created by 이주환 on 2022/09/24.
//

import UIKit

class FirstViewController: UIViewController {
    
    //MARK: pravate var & let Outlet
    var weight: Float?
    var height: Float?
    
    private var firstLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.text = "BMI 결과값"
        lb.font = .systemFont(ofSize: 18)
        return lb
    }()
    
    private var mainLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        //lb.backgroundColor = .blue
        lb.text = ""
        lb.font = .boldSystemFont(ofSize: 24)
        return lb
    }()
    
    private var secondLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.text = ""
        lb.font = .systemFont(ofSize: 18)
        return lb
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 15
        st.axis = .vertical
        st.distribution = .fill
        st.alignment = .fill
        return st
    }()
    
    private var Backbutton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("다시 계산하기", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        return btn
    }()
    
    
    //MARK: view cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        bmiCheck()
    }
    
    //MARK: bmi calculation and setting method
    func bmiCheck(){
        
        guard let we = weight else {
            return
        }
        guard let he = height else {
            return
        }
        
        let bmi = we/((he/100) * (he/100))
        
        if bmi < 18.5 {
            mainLabel.backgroundColor = #colorLiteral(red: 0.4024667442, green: 1, blue: 0.9252871871, alpha: 1)
            mainLabel.text = String(format: "%.2f", bmi)
            secondLabel.text = "저체중"
        } else if 18.6 < bmi && bmi < 22.9 {
            mainLabel.backgroundColor = #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1)
            mainLabel.text = String(format: "%.2f", bmi)
            secondLabel.text = "표준"
        } else if 23.0 < bmi && bmi < 24.9 {
            mainLabel.backgroundColor = #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1)
            mainLabel.text = String(format: "%.2f", bmi)
            secondLabel.text = "과체중"
        } else if 25.0 < bmi && bmi < 29.9 {
            mainLabel.backgroundColor = #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1)
            mainLabel.text = String(format: "%.2f", bmi)
            secondLabel.text = "중도 비만"
        } else if 30.0 < bmi {
            mainLabel.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
            mainLabel.text = String(format: "%.2f", bmi)
            secondLabel.text = "고도 비만"
        }
        
    }
    
    //MARK: auto layout set
    func setUp(){
        
        view.addSubview(Backbutton)
        view.addSubview(firstLabel)
        view.addSubview(mainLabel)
        view.addSubview(secondLabel)
        view.addSubview(stackView)
        
        [firstLabel,mainLabel,secondLabel].map {
            self.stackView.addArrangedSubview($0)
        }
        
        stackView.topAnchor.constraint(equalTo: view.topAnchor, constant: 130).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        
        Backbutton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        Backbutton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        Backbutton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        Backbutton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
    //MARK: btn method
    @objc func backBtnTouch(){
        dismiss(animated: true)
        
    }
    
    
}
