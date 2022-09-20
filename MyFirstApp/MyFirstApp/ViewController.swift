//
//  ViewController.swift
//  MyFirstApp
//
//  Created by 이주환 on 2022/09/15.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var button: UIButton!
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.label.text = "안녕하세요"
        self.button.setTitle("Hi", for: .normal)
        self.label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    }
    
    @IBAction func btnInside(_ sender: UIButton){
        if self.label.text == "안녕하세요"{
            self.label.text = "반갑습니다"
        }
        else{
            self.label.text = "안녕하세요"
        }
    }


}

