//
//  ViewController.swift
//  BMI
//
//  Created by 이주환 on 2022/09/24.
//

import UIKit

class ViewController: UIViewController {
    
    private let textViewHeight: CGFloat = 48
    
    private var weightTf: UITextField = {
       let tf = UITextField()
        tf.placeholder = "몸무게를 입력하시오"
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    private var heightTf: UITextField = {
       let tf = UITextField()
        tf.placeholder = "키를 입력하시오"
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    private var mainLabel: UILabel = {
        let lb = UILabel()
        lb.text = "키와 몸무게를 입력해 주세요"
        lb.font = .boldSystemFont(ofSize: 18)
        return lb
    }()
    
    private var weightLabel: UILabel = {
       let lb = UILabel()
        lb.text = "몸무게"
        return lb
    }()
    private var heightLabel: UILabel = {
       let lb = UILabel()
        lb.text = "키"
        return lb
    }()
    
    private var button: UIButton = {
       let btn = UIButton()
        btn.setTitle("BMI 계산하기", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.isEnabled = false
        btn.addTarget(self, action: #selector(bmiBtnTouch), for: .touchUpInside)
        return btn
    }()
    
    private lazy var stackView: UIStackView = {
        let st = UIStackView()
        st.translatesAutoresizingMaskIntoConstraints = false
        st.spacing = 20
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
//        st.backgroundColor = .gray
        return st
    }()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setUp()
    }
    
    func setUp(){
        view.addSubview(stackView)
        view.addSubview(button)
        view.addSubview(mainLabel)
        view.addSubview(heightLabel)
        view.addSubview(heightTf)
        view.addSubview(weightLabel)
        view.addSubview(weightTf)

        [mainLabel,heightLabel, heightTf, weightLabel,weightTf].map {
            self.stackView.addArrangedSubview($0)
        }
        
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        button.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
    
    @objc func bmiBtnTouch(){
        
        let firstVC = FirstViewController()
        
        firstVC.height = Float(heightTf.text!)
        firstVC.weight = Float(weightTf.text!)
        
        firstVC.modalPresentationStyle = .fullScreen
        self.present(firstVC, animated: true)
    }

}

extension ViewController: UITextFieldDelegate{
    
    @objc private func textFieldEditingChanged(_ textField: UITextField) {
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let wgt = weightTf.text, !wgt.isEmpty,
            let hgt = heightTf.text, !hgt.isEmpty
        else {
            button.backgroundColor = .black
            button.isEnabled = false
            return
        }
        button.backgroundColor = .blue
        button.isEnabled = true
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

