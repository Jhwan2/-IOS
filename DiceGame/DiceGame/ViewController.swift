//
//  ViewController.swift
//  DiceGame
//
//  Created by 이주환 on 2022/09/17.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstImg: UIImageView!
    @IBOutlet weak var secondImg: UIImageView!
    var diceArray: [UIImage] = [#imageLiteral(resourceName: "black1"), #imageLiteral(resourceName: "black2"), #imageLiteral(resourceName: "black3"), #imageLiteral(resourceName: "black4"), #imageLiteral(resourceName: "black5"), #imageLiteral(resourceName: "black6") ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    
    @IBAction func rollBtnInside(_ sender: UIButton) {
        firstImg.image = diceArray.randomElement()
        secondImg.image = diceArray.randomElement()
    }
    
    
    
}

