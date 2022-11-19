//
//  SearchCollectionViewCell.swift
//  MusicSearch
//
//  Created by 이주환 on 2022/11/19.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var collectionImg: UIImageView!
    
    override func prepareForReuse() {
        super.prepareForReuse()
        self.collectionImg.image = nil
    }
    
    var imageUrl: String? {
        didSet {
            loadImage()
        }
    }
    
    // URL ===> 이미지를 셋팅하는 메서드
    private func loadImage() {
        guard let urlString = self.imageUrl, let url = URL(string: urlString)  else { return }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            // 오래걸리는 작업이 일어나고 있는 동안에 url이 바뀔 가능성 제거 ⭐️⭐️⭐️
            guard self.imageUrl! == url.absoluteString else { return }
            
            DispatchQueue.main.async {
                self.collectionImg.image = UIImage(data: data)
            }
        }
    }
    
}
