
import UIKit
import SnapKit

protocol CustomStoryCellDelegate: class {
    func pushVC()
}

class CustomStoryCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource {
    
    var stories = [Story]()
    
    weak var delegate: CustomStoryCellDelegate?
    
    
    
    static let identifier = "CustomStoryCell"
    
    let storyCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.clipsToBounds = true
        view.showsHorizontalScrollIndicator = false
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        storyCollectionView.delegate = self
        storyCollectionView.dataSource = self
        setupCollectionView()
        setupSubViews()
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(headerViewTapped))
        storyCollectionView.addGestureRecognizer(tapGesture)
                                                
        stories = [
            Story(name: "harrypotter", image: "image2"),
            Story(name: "yamodelrussia", image: "image1"),
            Story(name: "ktobuhat", image: "image2"),
            Story(name: "rijayalisa", image: "image4"),
            Story(name: "zadrot", image: "image5"),
            Story(name: "rijayalisa", image: "image4")
        ]
    }
    
    func setupSubViews(){
        addSubview(storyCollectionView)
        storyCollectionView.snp.makeConstraints { make in
            make.height.width.equalToSuperview()
        }
    }
    
    private func setupCollectionView(){
        storyCollectionView.register(StoryCell.self, forCellWithReuseIdentifier: "StoryCell")
    }
    
        func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return stories.count
        }
        
        func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "StoryCell", for: indexPath) as! StoryCell
            cell.story = stories[indexPath.row]
            return cell
        }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: frame.height - 10, height: frame.height - 10)
    }
        
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    @objc func headerViewTapped() {
    delegate?.pushVC()
  }
    
}
