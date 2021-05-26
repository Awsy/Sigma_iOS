
import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
	
	
	var clocks = ["Kyiv", "London", "Paris"]
	
	@IBOutlet var table: UITableView!

	override func viewDidLoad() {
		super.viewDidLoad()
		
		table.delegate = self
		table.dataSource = self
		
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return clocks.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = clocks[indexPath.row]
		cell.textLabel?.font = UIFont(name: "Arial", size: 22)
		return cell
	}
	
	func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
		return true
	}
	
	func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
		clocks.swapAt(sourceIndexPath.row, destinationIndexPath.row)
	}
	
	@IBAction func didTapEdit(){
		if table.isEditing {
			table.isEditing = false
		} else {
			table.isEditing = true
		}
	}


}

