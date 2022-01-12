//
//  StoryCell.swift
//  TipaInstagram
//
//  Created by Ruslan Sharshenov on 12.01.2022.
//

import Foundation
import UIKit
import SnapKit

class StoryCell: UICollectionViewCell{
    
    
    var story: Story? {
        didSet{
            if let image = story?.image{
                storyImage.image = UIImage(named: image)
            }
            self.titleName.text = story?.name
        }
    }
    
    private lazy var storyImage: UIImageView = {
        let view = UIImageView()
        view.clipsToBounds = true
        view.layer.cornerRadius = self.frame.width / 2
        view.backgroundColor = .red
        view.contentMode = .scaleAspectFill
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 3
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private lazy var titleName: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12,weight: .bold)
        view.textColor = .black
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupSubViews()
    }
    
    private func setupSubViews(){
        addSubview(storyImage)
        storyImage.snp.makeConstraints { make in
            make.top.equalToSuperview()
            make.centerX.equalToSuperview()
            make.width.equalTo(60)
            make.height.equalTo(60)
        }
        addSubview(titleName)
        titleName.snp.makeConstraints { make in
            make.top.equalTo(storyImage.snp.bottom)
            make.centerX.equalTo(storyImage)
        }
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
