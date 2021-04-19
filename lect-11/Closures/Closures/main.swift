
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
	
	
	init?(_ name: String,_ surname: String,_ salary: Double,_ dob: String,_ acceptanceDate: String,_ maritalStatus: String,_ education: String, job: Job,_ experience: Int) {
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



class Enterprise: Worker {
	var workers: [String]
	var manager: Manager
	var hire = { () -> String in
		return "worker has been hired"
	}
	
	// MARK: - Описати функцію у підприємстві яка буде знаходити робітників обраного типу (вчитель, водій, і тд) та повертати іх через замкнення. Якщо робітники знайдені – викликати у усіх одну функцію (на вибір: привітатися, їсти, тд).
	
	var staff = {(worker: Worker) -> String in
		switch worker.job {
			case .teacher:
				return { () -> String in
					return "Hello everyone"
				}()
			case .driver:
				return { () -> String in
					return "Hello everyone"
				}()
			case .seller:
				return { () -> String in
					return "Hello everyone"
				}()
			case .fisherman:
				return { () -> String in
					return "Hello everyone"
				}()
			default:
				<#code#>
		}
	}
	
	// MARK: - Визначити функцію, яка знаходить одного робітника (залежить від вхідного критерію функції, не схожий з 1-м завданням) та повертає його через замкнення. Якщо робітник знайден, то вивести на екран його ім’я та прізвище, якщо ні – вивести на екран відповідний запис.
	
	
	
	
	
	//----------------------------------
	
	
	init(workers: [String], manager: Manager) {
		self.workers = workers
		self.manager = manager
	}
}

class Manager: Worker {
	
	var interviewNewbies:(String) -> (String) = { interview in
	return "\(interview) is part of manager's duty"
	}
	var fireWorkers: (String) -> (String) = { fire in
		return "\(fire) workers is part of manager's duty"
	}
	

	
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

