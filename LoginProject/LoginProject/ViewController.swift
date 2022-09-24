//
//  ViewController.swift
//  LoginProject
//
//  Created by 이주환 on 2022/09/21.
//

import UIKit

final class ViewController: UIViewController {
    //MARK: property
    private let textViewHeight: CGFloat = 48
    lazy var idView: UIView = {
        let view = UIView()
        view.backgroundColor = .gray
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(idLabel)
        view.addSubview(idTextField)
        return view
    }()
    
    var idLabel: UILabel = {
        let label = UILabel()
        label.text = "이메일주소 또는 전화번호"
        label.font = .systemFont(ofSize: 18)
        label.textColor = .white
        return label
    }()
    
    var idTextField: UITextField = {
        var tf = UITextField()
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.keyboardType = .emailAddress
        //tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    lazy var pwView: UIView = {
        let view = UIView()
        view.frame.size.height = 48
        view.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        view.layer.cornerRadius = 5
        view.clipsToBounds = true
        view.addSubview(pwTextField)
        view.addSubview(pwLabel)
        view.addSubview(pwApearBtn)
        return view
    }()
    
    var pwLabel: UILabel = {
        let label = UILabel()
        label.text = "비밀번호"
        label.font = UIFont.systemFont(ofSize: 18)
        label.textColor = #colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1)
        return label
    }()
    var pwTextField: UITextField = {
        let tf = UITextField()
        tf.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        tf.frame.size.height = 48
        tf.backgroundColor = .clear
        tf.textColor = .white
        tf.tintColor = .white
        tf.autocapitalizationType = .none
        tf.autocorrectionType = .no
        tf.spellCheckingType = .no
        tf.isSecureTextEntry = true
        tf.clearsOnBeginEditing = false
        tf.addTarget(self, action: #selector(textFieldEditingChanged(_:)), for: .editingChanged)
        return tf
    }()
    
    var loginBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
        button.setTitle("로그인", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.isEnabled = false
//        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    var pwResetBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.backgroundColor = .clear
        button.setTitle("비밀번호 재설정", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var pwApearBtn: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("표시", for: .normal)
        button.setTitleColor(#colorLiteral(red: 0.8374180198, green: 0.8374378085, blue: 0.8374271393, alpha: 1), for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 14, weight: .light)
        button.addTarget(self, action: #selector(passwordSecureModeSetting), for: .touchUpInside)
        return button
    }()

    lazy var stackView: UIStackView = {
        let st = UIStackView(arrangedSubviews: [idView, pwView, loginBtn])
        st.spacing = 18
        st.axis = .vertical
        st.distribution = .fillEqually
        st.alignment = .fill
        return st
    }()
    
    // 오토레이아웃 향후 변경을 위한 변수(애니메이션)
    lazy var emailInfoLabelCenterYConstraint = idLabel.centerYAnchor.constraint(equalTo: idView.centerYAnchor)
    lazy var passwordInfoLabelCenterYConstraint = pwLabel.centerYAnchor.constraint(equalTo: pwView.centerYAnchor)

    //MARK: cycle in view
    override func viewDidLoad() {
        super.viewDidLoad()
        pwTextField.delegate = self
        idTextField.delegate = self
        layoutSet()
        
    }
    //MARK: Auto Layout set Method
    func layoutSet() {
        view.backgroundColor = .black
        [stackView, pwResetBtn].forEach { view.addSubview($0) }
        
        idLabel.translatesAutoresizingMaskIntoConstraints = false
        idTextField.translatesAutoresizingMaskIntoConstraints = false
        pwLabel.translatesAutoresizingMaskIntoConstraints = false
        pwTextField.translatesAutoresizingMaskIntoConstraints = false
        pwApearBtn.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        pwResetBtn.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            idLabel.leadingAnchor.constraint(equalTo: idView.leadingAnchor, constant: 8),
            idLabel.trailingAnchor.constraint(equalTo: idView.trailingAnchor, constant: 8),
            //idLabel.centerYAnchor.constraint(equalTo: idView.centerYAnchor, constant: 0),
            emailInfoLabelCenterYConstraint,
            
            idTextField.topAnchor.constraint(equalTo: idView.topAnchor, constant: 15),
            idTextField.bottomAnchor.constraint(equalTo: idView.bottomAnchor, constant: 2),
            idTextField.leadingAnchor.constraint(equalTo: idView.leadingAnchor, constant: 8),
            idTextField.trailingAnchor.constraint(equalTo: idView.trailingAnchor, constant: 8),
            
            
            pwLabel.leadingAnchor.constraint(equalTo: pwView.leadingAnchor, constant: 8),
            pwLabel.trailingAnchor.constraint(equalTo: pwView.trailingAnchor, constant: 8),
            //pwLabel.centerYAnchor.constraint(equalTo: pwView.centerYAnchor),
            passwordInfoLabelCenterYConstraint,
            
            
            pwTextField.topAnchor.constraint(equalTo: pwView.topAnchor, constant: 15),
            pwTextField.bottomAnchor.constraint(equalTo: pwView.bottomAnchor, constant: 2),
            pwTextField.leadingAnchor.constraint(equalTo: pwView.leadingAnchor, constant: 8),
            pwTextField.trailingAnchor.constraint(equalTo: pwView.trailingAnchor, constant: 8),
            
            
            pwApearBtn.topAnchor.constraint(equalTo: pwView.topAnchor, constant: 15),
            pwApearBtn.bottomAnchor.constraint(equalTo: pwView.bottomAnchor, constant: -15),
            pwApearBtn.trailingAnchor.constraint(equalTo: pwView.trailingAnchor, constant: -8),
            
            
            stackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            stackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            stackView.heightAnchor.constraint(equalToConstant: textViewHeight*3 + 36),
            
            
            pwResetBtn.topAnchor.constraint(equalTo: stackView.bottomAnchor, constant: 10),
            pwResetBtn.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30),
            pwResetBtn.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            pwResetBtn.heightAnchor.constraint(equalToConstant: textViewHeight)
        ])
    }
    
    //MARK: App create Method
    @objc func resetButtonTapped(){
        let alert = UIAlertController(title: "비밀번호를 바꾸기", message: "비밀번호를 바꾸시겠습니까 ? ", preferredStyle: .alert)
        let alertAction = UIAlertAction(title: "확인", style: .default){ action in
            print("확인")
        }
        let alertCancle = UIAlertAction(title: "취소", style: .cancel){ cancle in
            print("취소")
        }
        alert.addAction(alertAction)
        alert.addAction(alertCancle)
        present(alert, animated: true, completion: nil)
    }
    
    @objc func passwordSecureModeSetting(){
        pwTextField.isSecureTextEntry.toggle()
    }
    
    // 앱의 화면을 터치하면 동작하는 함수
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }

}
//MARK: Extension - TextFieldDelegate
extension ViewController: UITextFieldDelegate {
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField == idTextField {
            idView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            idLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            emailInfoLabelCenterYConstraint.constant = -13
        }
        
        if textField == pwTextField {
            pwView.backgroundColor = #colorLiteral(red: 0.2972877622, green: 0.2973434925, blue: 0.297280401, alpha: 1)
            pwLabel.font = UIFont.systemFont(ofSize: 11)
            // 오토레이아웃 업데이트
            passwordInfoLabelCenterYConstraint.constant = -13
        }
        
        // 실제 레이아웃 변경은 애니메이션으로 줄꺼야
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField == idTextField {
            idView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            // 빈칸이면 원래로 되돌리기
            if idTextField.text == "" {
                idLabel.font = UIFont.systemFont(ofSize: 18)
                emailInfoLabelCenterYConstraint.constant = 0
            }
        }
        if textField == pwTextField {
            pwView.backgroundColor = #colorLiteral(red: 0.2, green: 0.2, blue: 0.2, alpha: 1)
            // 빈칸이면 원래로 되돌리기
            if pwTextField.text == "" {
                pwLabel.font = UIFont.systemFont(ofSize: 18)
                passwordInfoLabelCenterYConstraint.constant = 0
            }
        }
        
        // 실제 레이아웃 변경은 애니메이션으로 줄꺼야
        UIView.animate(withDuration: 0.3) {
            self.stackView.layoutIfNeeded()
        }
    }
 
//    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
//        if idTextField.text != "" && pwTextField.text != "" {
//            loginBtn.backgroundColor = .red
//            loginBtn.isEnabled = true
//        }
//        else {
//            loginBtn.backgroundColor = .clear
//            loginBtn.isEnabled = false
//        }
//        return true
//    }
    
    @objc func textFieldEditingChanged(_ textField: UITextField){
        if textField.text?.count == 1 {
            if textField.text?.first == " " {
                textField.text = ""
                return
            }
        }
        guard
            let email = idTextField.text, !email.isEmpty,
            let password = pwTextField.text, !password.isEmpty
        else {
            loginBtn.backgroundColor = .clear
            loginBtn.isEnabled = false
            return
        }
        loginBtn.backgroundColor = .red
        loginBtn.isEnabled = true
    }
    
    // 엔터 누르면 일단 키보드 내림
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
}


