import UIKit
import SnapKit

class CollectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    var stories = [Story]()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.isPagingEnabled = true
        view.register(ImageCollectionViewCell.self, forCellWithReuseIdentifier: "ImageCollectionViewCell")
        return view
    }()
    
    override func viewDidLoad() {
        setupSubviews()
        
        stories = [
            Story(name: "harrypotter", image: "image2"),
            Story(name: "yamodelrussia", image: "image1"),
            Story(name: "ktobuhat", image: "image2"),
            Story(name: "rijayalisa", image: "image4"),
            Story(name: "zadrot", image: "image5"),
            Story(name: "rijayalisa", image: "image4")
        ]
        
    }
    
    private func setupSubviews() {
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
       
            return CGSize(
                width: view.frame.width,
                height: view.frame.height
            )
        
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return stories.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ImageCollectionViewCell", for: indexPath) as! ImageCollectionViewCell
        
        cell.configure(image: stories[index].image!, name: stories[index].name!)
        
        return cell
    }
}
