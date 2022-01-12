//
//  CustomCVC.swift
//  CookingApp
//
//  Created by Ruslan Sharshenov on 08.01.2022.
//

import UIKit
import SnapKit

class ImageCollectionViewCell: UICollectionViewCell {
    
    static let identifier = "ImageCollectionViewCell"
    
    private lazy var imageView: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    private lazy var nameText: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 15, weight: .bold)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(imageView)
        contentView.addSubview(nameText)
        contentView.clipsToBounds = true
        
    }
    
    override func layoutSubviews() {
        imageView.snp.makeConstraints { make in
            make.left.right.bottom.equalToSuperview()
            make.top.equalToSuperview().offset(self.frame.width / 20)
        }
        nameText.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.right.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(image: String, name: String) {
        imageView.image = UIImage(named: "\(image)")
        nameText.text = name
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        imageView.image = nil
        nameText.text = nil
    }
    
}
