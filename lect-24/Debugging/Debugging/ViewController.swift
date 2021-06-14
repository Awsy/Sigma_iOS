
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
	
	@IBOutlet weak var table: UITableView!
	
	var valuesArray = [Int]()
	var limit = 20
	let totalStrings = 100

	override func viewDidLoad() {
		super.viewDidLoad()
		
		table.dataSource = self
		table.delegate = self
				
		var index = 0
		while index < limit {
			valuesArray.append(index)
			index += 1
		}
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return valuesArray.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
		
		if cell == nil {
			cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
		}
		
		
		
		cell?.textLabel?.text = "Random value \(valuesArray[indexPath.row])"
		
		return cell!
	}
	
	func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
		if indexPath.row == valuesArray.count - 1 {
			if valuesArray.count < totalStrings {
				var index = valuesArray.count
				limit = index + 20
				while index < limit {
					valuesArray.append(index)
					index += 1
				}
				
				self.perform(#selector(loadValues), with: nil, afterDelay: 0.5)
			}
		}
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 50.0
	}
	
	@objc func loadValues() {
		self.table.reloadData()
	}


}

