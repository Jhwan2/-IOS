//
//  BMIManeger.swift
//  BMI
//
//  Created by 이주환 on 2022/09/28.
//

import UIKit

class BMIManeger {
    
    private var bmi: BMI?
    
    func getBMI(w:String, h:String) -> BMI? {
        
        let we = Float(w)!
        let he = Float(h)!
        
        
        let value = we/((he/100) * (he/100))
        print(we,he)
        
        if value < 18.5 {
            let vBmi = BMI(value: value, backColor: #colorLiteral(red: 0.4024667442, green: 1, blue: 0.9252871871, alpha: 1), string: "저체중")
            bmi = vBmi
        } else if 18.6 < value && value < 22.9 {
            let vBmi = BMI(value: value, backColor: #colorLiteral(red: 0.721568644, green: 0.8862745166, blue: 0.5921568871, alpha: 1), string: "표준")
            bmi = vBmi
        } else if 23.0 < value && value < 24.9 {
            let vBmi = BMI(value: value, backColor: #colorLiteral(red: 0.9098039269, green: 0.4784313738, blue: 0.6431372762, alpha: 1), string: "과체중")
            bmi = vBmi
        } else if 25.0 < value && value < 29.9 {
            let vBmi = BMI(value: value, backColor: #colorLiteral(red: 0.9411764741, green: 0.4980392158, blue: 0.3529411852, alpha: 1), string: "중도 비만")
            bmi = vBmi
        } else if 30.0 < value {
            let vBmi = BMI(value: value, backColor: #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1), string: "고도 비만")
            bmi = vBmi
        }
        return bmi
    }
    
    
    
    
}
