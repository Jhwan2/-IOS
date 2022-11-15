//
//  MyCollectionViewCell.swift
//  DataBaseUISetting
//
//  Created by 이주환 on 2022/11/09.
//

import UIKit

class MyCollectionViewCell: UICollectionViewCell {
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    @IBOutlet weak var mainImgView: UIImageView!
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var subLabel: UILabel!
    @IBOutlet weak var detailLabel: UILabel!
    
}
