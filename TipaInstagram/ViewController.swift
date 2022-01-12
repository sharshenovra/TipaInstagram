import UIKit
import SnapKit


class ViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, CustomStoryCellDelegate  {
    
    var profiles: [Profiles] = []
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        
        let view = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        view.delegate = self
        view.dataSource = self
        view.register(CustomInstaCell.self, forCellWithReuseIdentifier: "CustomInstaCell")
        view.register(CustomProfileCell.self, forCellWithReuseIdentifier: "CustomProfileCell")
        view.register(CustomStoryCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "CustomStoryCell")
        view.showsVerticalScrollIndicator = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
      setupSubViews()
        setupProfiles()
    }

    private func setupSubViews(){
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    private func setupProfiles(){
        profiles.append(Profiles(name: "harrypotter", peopleImage: "image2"))
        profiles.append(Profiles(name: "yamodelrussia", peopleImage: "image1"))
        profiles.append(Profiles(name: "ktobuhat", peopleImage: "image3"))
        profiles.append(Profiles(name: "rijayalisa", peopleImage: "image4"))
        profiles.append(Profiles(name: "zadrot", peopleImage: "image5"))
        profiles.append(Profiles(name: "rijayalisa", peopleImage: "image4"))
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return profiles.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let index = indexPath.row
        if index % 2 == 0{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomProfileCell", for: indexPath) as! CustomProfileCell
            cell.configure(label: "\(profiles[index].name!)", image: UIImage(named: "\(profiles[indexPath.row].peopleImage!)")!)
            return cell
        }else{
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CustomInstaCell", for: indexPath) as! CustomInstaCell
            cell.configure(image: UIImage(named: "\(profiles[indexPath.row].peopleImage!)")!)
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let index = indexPath.row
        if index % 2 == 0{
            return CGSize(width: view.frame.width, height: view.frame.width / 4)
        }else {
            return CGSize(width: view.frame.width, height: view.frame.width)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CustomStoryCell", for: indexPath) as! CustomStoryCell
        header.backgroundColor = .red
        header.delegate = self
        return header
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.width / 4)
    }
    
    func pushVC() {
        navigationController?.pushViewController(CollectionVC(), animated: true)
        
    }
}

