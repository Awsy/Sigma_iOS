
import UIKit

class AddNumberButton: UICollectionViewCell {
	
	let addButton = UIButton(frame: CGRect(x: 50, y: 50, width: 30, height: 70))
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		addButton.setTitle("Add Number", for: .normal)
		addButton.layer.borderColor = UIColor.blue.cgColor
		addButton.layer.borderWidth = 5
		
		addButton.contentMode = .scaleAspectFit
		addSubview(addButton)
		addButton.centerInSuperview(size: .init(width: 40, height: 40))
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		layer.cornerRadius = frame.width / 2
	}
	
	required init?(coder aDecoder: NSCoder) {
		fatalError()
	}
	
}
