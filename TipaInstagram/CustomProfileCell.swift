
import UIKit
import SnapKit

class CustomProfileCell: UICollectionViewCell {
    
    static let identifier = "CustomProfileCell"
    
   lazy var peopleImage: UIImageView = {
        let view = UIImageView()
        view.layer.borderColor = UIColor.orange.cgColor
        view.layer.borderWidth = 3
       view.layer.cornerRadius = 30
       view.clipsToBounds = true
        return view
    }()
    
   lazy var titleText: UILabel = {
        let view = UILabel()
        view.font = UIFont.systemFont(ofSize: 12, weight: .bold)
        view.textAlignment = .center
        view.numberOfLines = 1
        return view
    }()
    
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(titleText)
        contentView.clipsToBounds = true
        contentView.addSubview(peopleImage)
        
    }
    
    override func layoutSubviews() {
        peopleImage.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalToSuperview()
            make.height.equalToSuperview().multipliedBy(0.7)
            make.width.equalToSuperview().dividedBy(6)
            
        }
        titleText.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.equalTo(peopleImage.snp.right)
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(label: String, image: UIImage) {
        titleText.text = label
        peopleImage.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        titleText.text = nil
        peopleImage.image = nil
    }
    
}
