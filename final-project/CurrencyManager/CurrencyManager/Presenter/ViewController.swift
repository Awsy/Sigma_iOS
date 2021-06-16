
import UIKit

// Tutorial screen
// Main screen: actions: Search, Link, Map, Phone
// Bank-Details screen
// Share screen
// Map screen

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var mainTable: UITableView!
	
	var photos: [UIImage] = [UIImage(named: "piggy-bank.png")!]
	
	override func viewDidLoad() {
		super.viewDidLoad()
		// Do any additional setup after loading the view.
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		return UITableViewCell()
	}


}

