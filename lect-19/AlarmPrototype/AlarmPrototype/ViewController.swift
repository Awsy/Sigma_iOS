
import UserNotifications
import UIKit

class ViewController: UIViewController {
	
	@IBOutlet var table: UITableView!
	
	var models = [MyReminder]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		table.delegate = self
		table.dataSource = self
	}
	
	@IBAction func didTapAdd() {
		
		guard let vc = storyboard?.instantiateViewController(identifier: "add") as? AddViewController else {
			return
		}
		
		vc.title = "New Alarm"
		vc.navigationItem.largeTitleDisplayMode = .never
		vc.completion = { title, body, date in
			DispatchQueue.main.async {
				self.navigationController?.popToRootViewController(animated: true)
				let new = MyReminder(title: title, date: date, identifier: "id_\(title)")
				self.models.append(new)
				self.table.reloadData()
				
				let content = UNMutableNotificationContent()
				content.title = title
				content.sound = .default
				content.body = body
				
				let targetDate = date
				let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second],
																										  from: targetDate),
															repeats: false)
				
				let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
				UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
					if error != nil {
						print("something went wrong")
					}
				})
			}
		}
		navigationController?.pushViewController(vc, animated: true)
		
	}
	
	@IBAction func didTapEdit() {
		UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound], completionHandler: { success, error in
			if success {
				
				self.scheduleEdit()
			}
			else if error != nil {
				print("error occurred")
			}
		})
	}
	
	func scheduleEdit() {
		let content = UNMutableNotificationContent()
		content.title = "Hello World"
		content.sound = .default
		content.body = "Edit began"
		
		let targetDate = Date().addingTimeInterval(10)
		let trigger = UNCalendarNotificationTrigger(dateMatching: Calendar.current.dateComponents([.year, .month, .day, .hour, .minute, .second], from: targetDate), repeats: false)
		
		let request = UNNotificationRequest(identifier: "some_long_id", content: content, trigger: trigger)
		UNUserNotificationCenter.current().add(request, withCompletionHandler: { error in
			if error != nil {
				print("something went wrong")
			}
		})
	}
	
}

extension ViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
	}
	
}


extension ViewController: UITableViewDataSource {
	
	func numberOfSections(in tableView: UITableView) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return models.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
		cell.textLabel?.text = models[indexPath.row].title
		let date = models[indexPath.row].date
		
		let formatter = DateFormatter()
		formatter.dateFormat = "MMM, dd, YYYY"
		cell.detailTextLabel?.text = formatter.string(from: date)
		
		cell.textLabel?.font = UIFont(name: "Arial", size: 25)
		cell.detailTextLabel?.font = UIFont(name: "Arial", size: 22)
		
		cell.contentView.backgroundColor = UIColor.black
		
		return cell
	}
	
}


struct MyReminder {
	let title: String
	let date: Date
	let identifier: String
}

