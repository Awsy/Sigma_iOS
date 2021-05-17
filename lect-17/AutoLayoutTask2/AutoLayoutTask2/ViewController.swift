
import UIKit

class ViewController: UIViewController {

	@IBOutlet weak var button2: UIButton!
	@IBOutlet weak var button3: UIButton!
	
	@IBOutlet weak var buttonContainer: UIView!


	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		button2.layer.cornerRadius = 10
		button2.clipsToBounds = true
		button3.layer.cornerRadius = 10
		button3.clipsToBounds = true
		buttonTapped()
		
	}
	
	@IBAction func buttonTapped() {
		
		let vc = storyboard?.instantiateViewController(identifier: "Cat2") as! CatViewController
		vc.navigationItem.largeTitleDisplayMode = .never
		navigationController?.pushViewController(vc, animated: true)
	}


}


class CatViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .blue
	}
}


class FieldsViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.backgroundColor = .red
	}
}
