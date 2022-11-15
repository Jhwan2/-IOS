//
//  ViewController.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/11/09.
//

import UIKit

public struct CVCell {
    static let spacingWitdh: CGFloat = 1
    static let cellColumns: CGFloat = 3
    private init() {}
}

final class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    let flowLayout = UICollectionViewFlowLayout()

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        collectionView.dataSource = self
        collectionView.delegate = self
//        collectionView.register(UINib.init(nibName: "MyCollecionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCollectionCell")
        
        collectionView.register(.init(nibName: "MyCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "movieCollectionCell")
        
        flowLayout.scrollDirection = .vertical
        
        let collectionCellWidth = (UIScreen.main.bounds.width - CVCell.spacingWitdh * (CVCell.cellColumns - 1)) / CVCell.cellColumns
        
        flowLayout.itemSize = CGSize(width: collectionCellWidth, height: collectionCellWidth)
        // 아이템 사이 간격 설정
        flowLayout.minimumInteritemSpacing = CVCell.spacingWitdh
        // 아이템 위아래 사이 간격 설정
        flowLayout.minimumLineSpacing = CVCell.spacingWitdh
        
        // 컬렉션뷰의 속성에 할당
        collectionView.collectionViewLayout = flowLayout
        
    }


}


extension ViewController: UICollectionViewDataSource {
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "movieCollectionCell", for: indexPath) as? MyCollectionViewCell else {
            return UICollectionViewCell()
        }
        
//        cell.mainLabel.text = "ebar"
        return cell
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout{
//    func col
}
