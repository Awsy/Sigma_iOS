
import Foundation

class Worker {
	let name: String
	let surname: String
	let salary: Double
	var dob: String
	var acceptanceDate: String
	enum Job {
		case teacher, driver, seller, fisherman
	}
	let maritalStatus: String
	let education: String
	let experience: Int
	let job: Job
	
	
	func acceptDate(_ acceptanceDate: Date) {
		let formatter = DateFormatter()
		formatter.dateStyle = .short
		print(formatter.string(from: acceptanceDate))
	}
	
	func calculateAge(dob: String) -> Int? {
		let dateFormatter = DateFormatter()
		dateFormatter.dateFormat = "MM/DD/YYYY"
		let birthdayDate = dateFormatter.date(from: dob)
		let calendar: NSCalendar! = NSCalendar(calendarIdentifier: .gregorian)
		let now = Date()
		let calcAge = calendar.components(.year, from: birthdayDate!, to: now, options: [])
		guard let age = calcAge.year else { return nil }
		return age
	}
	
	func calculateSalary(_ wage: Double,_ hours: Double) -> Double {
		
		let calculate = wage * hours
		return calculate
	}
	
	func findingLength(_ name: String,_ surname: String) {
		
		let findNameLength = name.count
		let findSurnameLength = surname.count
		print("\(findNameLength), \(findSurnameLength)")
	}
	
	
	func greeting(_ greets: String) -> String {
		return "\(self.name) is saying: \(greets)"
	}
	
	func complaining(_ complaint: String) -> String {
		return "\(self.name) is complaining about: \(complaint)"
	}
	
	func coffee(_ action: String) -> String {
		return "\(self.name) is drinking coffee"
	}
	
	func sleeping(_ sleep: String) -> String {
		return "\(self.name) is sleeping"
	}
	
	func eating(_ eat: String) -> String {
		return "\(self.name) is eating now"
	}
	
	func getPaid(_ earn: Double) -> String {
		return "\(self.name) is working hard to earn: \(earn)"
	}
	//----------------------------------------------------------
	
	init(_ name: String,_ surname: String,_ salary: Double,_ dob: String,_ acceptanceDate: String,_ maritalStatus: String,_ education: String, job: Job,_ experience: Int) {
		self.name = name
		self.surname = surname
		self.salary = salary
		self.dob = dob
		self.acceptanceDate = acceptanceDate
		self.maritalStatus = maritalStatus
		self.education = education
		self.experience = experience
		self.job = job
	}
}

protocol Interviewing {
	func interviewNewbies()
	func firing()
	func calculateSalary()
}

class Enterprise {
	var workers: [String]
	var manager: Manager
	var salary: Interviewing?
	
	init(workers: [String], manager: Manager) {
		self.workers = workers
		self.manager = manager
	}
}

class Manager: Worker {
	
	var interviewNewbies: Interviewing?
	var fireWorkers: Interviewing?
	
	func interviewNewbies(_ newbie: Worker) -> Bool {
		if self.experience >= 2 {
			print("\(newbie.name) is accepted")
			return true
		} else{
			print("Sorry, we don't hire newbies :(")
			return false
		}
	}
	
	func firing(_ worker: Worker) -> String {
		let isFired = true
		if isFired {
			return "\(self.name) has to leave"
		}
	}
}

