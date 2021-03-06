
import Foundation

// First task

// MARK: - Створити клас Parent і описати в ньому властивість name.

class Parent {
	
	let name: String
	let child: Son?
	
	
	init(name: String, child: Son?) {
		self.name = name
		self.child = child
		
		print(name)
	}
	
	
	// MARK: - Описати deinit і вивести в лог інформацію
	deinit {
		print(name)
	}
}

// MARK: - В ініціалізаторі присвоїти імя і вивести в лог
var name1 = Parent(name: "Aws", child: nil)
print(name1)


// MARK: - Створити sсope (наприклад do { .. } aбо функцію) та створити об’єкт всередині. Звернути увагу на логи

func scopeFunc() {
	let parentInit = Parent.init(name: "Aws", child: Son(parent: Parent.init(name: "LilWayne", child: nil)))
	print(parentInit)
}

scopeFunc()


// MARK: - Створити клас Son (з логами в init/dealloc як і в Person) з властивістю parent і додати властивість child в Person

class Son {
	weak var parent: Parent?
	
	init(parent: Parent) {
		self.parent = parent
		print(parent)
	}
	deinit {
		print(parent as Any)
		parent = nil
	}
	
}

// MARK: - Створити тестові об’єкти
var parent1 = Parent(name: "Martin", child: nil)
var son1 = Son(parent: Parent.init(name: "Joe", child: nil))
print(parent1)
print(son1)

