import UIKit

class MainViewController: UIViewController {
    
    
    //컬렉션뷰를 만드는 부분입니다. 스토리 보드로 예를 들자면 항목에서 컬렉션뷰를 찾아 클릭만 하고 아직 화면엔 가져다 놓지 않은 상태인거죠!
    let collectionView: UICollectionView = {
       let flowlayout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: flowlayout)
        
        return cv
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        // view.addSubView(화면에 표시하고싶은 거) 아까는 클릭만 한거라면 이 코드를 쓰면 화면에 올려놓은거에요 이제 화면에 표시 됩니다.
        view.addSubview(collectionView)
        // 컬렉션뷰 위치에 대한 설정
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        collectionView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
        collectionView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        collectionView.backgroundColor = .yellow
        
        
        
        
        
    }
    

    

}
