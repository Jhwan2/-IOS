//
//  CustomTableViewCell.swift
//  MoviewTableViewInCode
//
//  Created by 이주환 on 2022/10/02.
//

import UIKit

class CustomTableViewCell: UITableViewCell {
    
    let mainImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    let movieNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 17)
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 17)
        label.numberOfLines = 0
        return label
    }()
    
    let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.distribution  = .fill
        sv.alignment = .fill
        sv.spacing = 8
        return sv
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        setupStackView()
    }
    
    func setupStackView() {
        
        self.addSubview(mainImageView)
        
        // 뷰컨트롤러의 기본뷰 위에 스택뷰 올리기
        self.addSubview(stackView)
        
        // 스택뷰 위에 뷰들 올리기
        stackView.addArrangedSubview(movieNameLabel)
        stackView.addArrangedSubview(descriptionLabel)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func updateConstraints() {
        setConstraints()
        super.updateConstraints()
    }
    
    func setConstraints() {
        
        movieNameLabel.translatesAutoresizingMaskIntoConstraints = false
        stackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            mainImageView.heightAnchor.constraint(equalToConstant: 100),
            mainImageView.widthAnchor.constraint(equalToConstant: 100),
            mainImageView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            mainImageView.centerYAnchor.constraint(equalTo: self.centerYAnchor),
            
            movieNameLabel.heightAnchor.constraint(equalToConstant: 22),
            
            stackView.leadingAnchor.constraint(equalTo: mainImageView.trailingAnchor, constant: 15),
            stackView.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: self.mainImageView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: self.mainImageView.bottomAnchor)
        ])
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
