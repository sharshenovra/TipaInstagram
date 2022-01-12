
import UIKit
import SnapKit

class CustomInstaCell: UICollectionViewCell {
    
    static let identifier = "CustomInstaCell"
    
   lazy var peopleImage1: UIImageView = {
        let view = UIImageView()
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.addSubview(peopleImage1)
        contentView.clipsToBounds = true
        
    }
    
    override func layoutSubviews() {
        peopleImage1.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func configure(image: UIImage) {
        peopleImage1.image = image
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        peopleImage1.image = nil
        
    }
    
}
