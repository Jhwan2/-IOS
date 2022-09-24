//
//  FirstViewController.swift
//  BMI
//
//  Created by 이주환 on 2022/09/24.
//

import UIKit

class FirstViewController: UIViewController {

    var weight: Float?
    var height: Float?
    
    private var firstLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.text = "BMI 결과값"
        lb.font = .systemFont(ofSize: 20)
        return lb
    }()
    
    private var mainLabel: UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        //lb.backgroundColor = .blue
        lb.text = ""
        lb.font = .boldSystemFont(ofSize: 22)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setUp()
        info()
    }
    
    func info(){
        
        guard let we = weight else {
            return
        }
        guard let he = height else {
            return
        }
        
        let bmi = we/((he/100) * (he/100))

        mainLabel.text = String(format: "%.2f", bmi)
        secondLabel.text = String(he)
    }
    
    func setUp(){
        
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
        
    }
    
}
