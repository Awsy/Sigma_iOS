
import UIKit
import Foundation

class AddContactViewController: UIViewController {
	
	let fileManager = FileManager.default
	
	let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)[0].appendingPathComponent("myFile")

	
	struct Contact: Codable {
		var name: String
		var surname: String
		
//		func getTestData() -> [Contact] {
//			let contacts = ["Andrew", "Redfield"]
//			var saveContact = [Contact]()
//			for contact in contacts {
//				let event = Contact(name: name, surname: contact)
//				saveContact.append(event)
//			}
//			return saveContact
//		}
	}
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		
	}
	
	
}
