
import Foundation

// First task

/*
1- Кожен співробітник містить такі характеристики:
• Прізвище,
• Імя,
• Заробітна плата,
• Дата народження,
• Дата прийняття на роботу,
• Тип (вчитель, водій, продавець, рибалка тощо)
• Додатково (на ваш вибір 2-3 характеристики)
*/

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
	
	
	/*
	2- Обробити виключні ситуації робітників:
	• Дата прийняття і Дата народження
	• Вік
	• Зарплата
	• Довжина імені/прізвища і символи імені
	*/
	
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
	
	/*
	3- Робітники мають вміти
	• Привітатися
	• Пожалітися
	• Випити каву
	• Спати
	• Їсти
	• Отримати зарплатню
	*/
	
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


/*
4- Створити клас Директор.
• Директор має вміти делегувати якусь роботу робітникам (додати
будь-які 2-3 роботи).
• Всі робітники мають вміти виконувати роботу від директора.
• Директор приймає рішення по прийняттю співробітника на роботу
(придумати якусь “логіку” по бажанню).
*/

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

/*
5- Додати клас Підприємство який містить в собі:
• список (array) робітників різних профілів
• об’єкт директор.
Підприємство повинно містити методи для прийняття співробітника
на роботу, звільнення, зміну заробітної плати, пошук (equal).
*/

class Enterprise {
	var workers: [String]
	var manager: Manager
	var salary: Interviewing?
	
	init(workers: [String], manager: Manager) {
		self.workers = workers
		self.manager = manager
	}
}

/*
6- Продемонструвати можливості класів
*/

var company = Enterprise(workers: ["James, Adam, Rose"], manager: Manager.init("Adam", "Knoxville", 2300.50, "19/09/1987", "30/03/2021", "Single", "Master", job: .teacher, 3))
print(company)



// Second task

/*
1- Додатити категорії/розширення для Підприємства, які б містили
методи:
• Нарахування з/п згідно стажу (алгоритм придумати самостійно)
• Нарахування з/п для тих хто працює погодинно (алгоритм
придумати самостійно)
• Нарахування з/п за деякий період (вводиться дата початку та дата
кінця)
*/

extension Enterprise {
	
	func calculateSalary(_ wage: Double,_ hours: Double) -> Double {
		let calculate = wage * hours
		return calculate
	}

	
	func calculateSalaryByExperience(_ experience: Double) -> Double {
		var payment = 0.0
		if experience <= 1 {
			payment = 500
		}
		return payment
	}

}
