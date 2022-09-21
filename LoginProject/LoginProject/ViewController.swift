//
//  ViewController.swift
//  LoginProject
//
//  Created by 이주환 on 2022/09/21.
//

import UIKit

class ViewController: UIViewController {
    
    var idTextField: UITextField!
    var pwTextField: UITextField!
    var idLabel: UILabel!
    var pwLabel: UILabel!
    var loginBtn: UIButton!
    var pwResetBtn: UIButton!
    var pwApearBtn: UIButton!


    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.view.backgroundColor = .darkGray
        idTextField = UITextField(frame: CGRect(x: 0, y: 0, width: 200.00, height: 40.00));
        idTextField.backgroundColor = .gray
        self.view.addSubview(idTextField)
        //pwTextField.backgroundColor = .gray
        idTextField.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        idTextField.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        
        
        
        
    }


}

