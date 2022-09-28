//
//  FirstViewUI.swift
//  BMI
//
//  Created by 이주환 on 2022/09/28.
//

import UIKit

class FirstViewUI: UIView {
    
    private var firstLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.text = "BMI 결과값"
        lb.font = .systemFont(ofSize: 18)
        return lb
    }()
    
    
    var mainLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        //lb.backgroundColor = .blue
        lb.text = ""
        lb.font = .boldSystemFont(ofSize: 24)
        return lb
    }()
    
    var secondLabel: UILabel = {
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
    
    var Backbutton: UIButton = {
       let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.setTitle("다시 계산하기", for: .normal)
        btn.backgroundColor = .black
        btn.setTitleColor(.white, for: .normal)
        //btn.addTarget(self, action: #selector(backBtnTouch), for: .touchUpInside)
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: auto layout set
    func setUp(){
        
        addSubview(Backbutton)
        addSubview(firstLabel)
        addSubview(mainLabel)
        addSubview(secondLabel)
        addSubview(stackView)
        
        [firstLabel,mainLabel,secondLabel].map {
            self.stackView.addArrangedSubview($0)
        }
        
        stackView.topAnchor.constraint(equalTo: topAnchor, constant: 130).isActive = true
        stackView.widthAnchor.constraint(equalToConstant: 200).isActive = true
        stackView.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        Backbutton.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -30).isActive = true
        Backbutton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20).isActive = true
        Backbutton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20).isActive = true
        Backbutton.heightAnchor.constraint(equalToConstant: 45).isActive = true
        
    }
    
}
