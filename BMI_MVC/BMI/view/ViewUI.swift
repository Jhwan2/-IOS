//
//  ViewUI.swift
//  BMI
//
//  Created by 이주환 on 2022/09/28.
//

import UIKit

class ViewUI: UIView {
    
    private let textViewHeight: CGFloat = 48
    
    var weightTf: UITextField = {
       let tf = UITextField()
        tf.placeholder = "몸무게를 입력하시오"
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    var heightTf: UITextField = {
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
    
    var button: UIButton = {
       let btn = UIButton()
        btn.setTitle("BMI 계산하기", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        btn.isEnabled = false
        //btn.addTarget(self, action: #selector(bmiBtnTouch), for: .touchUpInside)
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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        
        heightTf.delegate = self
        weightTf.delegate = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setUp(){
        self.addSubview(stackView)
        self.addSubview(button)
        self.addSubview(mainLabel)
        self.addSubview(heightLabel)
        self.addSubview(heightTf)
        self.addSubview(weightLabel)
        self.addSubview(weightTf)
        
        self.backgroundColor = .white
        
        heightTf.delegate = self
        weightTf.delegate = self

        [mainLabel,heightLabel, heightTf, weightLabel,weightTf].map {
            self.stackView.addArrangedSubview($0)
        }
        
        //stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        stackView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        stackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36).isActive = true
        
        button.translatesAutoresizingMaskIntoConstraints = false
        button.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        button.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        button.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        button.heightAnchor.constraint(equalToConstant: 45).isActive = true
    }
}

extension ViewUI: UITextFieldDelegate {
    
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
