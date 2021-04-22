import UIKit
import CoreData


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
        
        getAllItems()
        
    }
    
    
    // Core Data
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
    private var models = [Shortcut]()
    	
    // get all items -> all titles in Shortcut model
    func getAllItems() {
        do {
            models = try context.fetch(Shortcut.fetchRequest())
            DispatchQueue.main.async {
                self.collectionView.reloadData()
                // UI에서 사용할 때, let model = models[indexPath.row] 지정 후 model.name 과 같이 사용
            }
        }
        catch {
            //error
        }
    }
    
    // create an item -> title and save it to Shortcut model
    func createItem(name: String) {
        let newItem = Shortcut(context: context)
        newItem.title = title
        //newItem.option = String()
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    // delete an item -> title from Shortcut model
    func deleteItem(item: Shortcut) {
        context.delete(item)
        
        do {
            try context.save()
            getAllItems()
        }
        catch {
            
        }
    }
    
    // get a new item -> new title and update to an original title
    func updateItem(item: Shortcut, newTitle: String) {
        item.title = newTitle
        do {
            try context.save()
        }
        catch {
            
        }
    }

}
