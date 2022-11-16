//
//  JsonPassing.swift
//  MusicSearch
//
//  Created by 이주환 on 2022/11/14.
//

import Foundation
import UIKit
//import

final class musicSearchManager {
    
    var musicArr: MusicData!
    
    
    func setup(){
        //간단화 한 즉, 자주쓰게될 url 코드
        let musicURL = "https://itunes.apple.com/search?media=music&term="
        let searchKeyWord = "jazz"
//        let

        guard let url = URL(string: musicURL+searchKeyWord) else{ return }
    
        URLSession.shared.dataTask(with: url) { data, responde, error in
            // code editting
            if error != nil {
                return }
            guard let safeData = data else { return }
            
            do { //do catch 그리고 try 사용해야함.
                   // 스위프트5
                   // 자동으로 원하는 클래스/구조체 형태로 분석
                   // JSONDecoder
                let decoder = JSONDecoder()
                print(String(data: safeData, encoding: .utf8)!)
                let decodedData = try decoder.decode(MusicData.self, from: safeData)
                   // jsondecoder를 통한 앞서 task의 클로저에 받아온 data(json)을
                   // 내가 정의한(홈페이지로 변환시킨) 구조체로 변환 해줌.

                dump(decodedData)
                self.musicArr = decodedData

            } catch {
                print("decode Fail!!")
                return }
        }.resume()
    }
    
    
}
