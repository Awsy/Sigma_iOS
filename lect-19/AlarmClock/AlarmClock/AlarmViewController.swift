
import UIKit

class AlarmViewController: UIViewController, UICollectionViewDataSource {
	
	@IBOutlet weak var collectionView: UICollectionView!
	
	
	var Alarms = ["6:05", "7:32"]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		collectionView.dataSource = self;
		
	}
	
	func numberOfSections(in collectionView: UICollectionView) -> Int {
		return 1
	}
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		
		return 3
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell2", for: indexPath) as! CollectionViewCell
		
		cell.backgroundColor = UIColor.darkGray
		cell.label.text = String(indexPath.item)
		
		return cell
	}
	

	
	
	@IBAction func didTouchEdit() {
		if collectionView.isEditing {
			collectionView.isEditing = false
		} else {
			collectionView.isEditing = true
		}
	}
	
	
}

