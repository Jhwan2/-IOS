//
//  ViewController.swift
//  TextFieldProject
//
//  Created by 이주환 on 2022/09/20.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    func setup() {
        view.backgroundColor = .gray
        textField.keyboardType = .emailAddress
        textField.placeholder = "이메일 입력"
        textField.clearButtonMode = .always
        textField.returnKeyType = .go
        textField.delegate = self
    }
    
    @IBAction func doneBtn(_ sender: UIButton) {
    }
    

}

