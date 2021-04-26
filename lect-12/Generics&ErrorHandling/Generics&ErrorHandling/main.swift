
import Foundation



// First task - Математика (продовження)

// MARK: - використовувався або універсальний клас, або універсальна функція;

class ExpandValue<T> {
	var area: T
	
	init(area: T) {
		self.area = area
	}
}

let example1 = ExpandValue<Double>(area: 23.9)
let example2 = ExpandValue<Int>(area: 51)


// MARK: - використутовувався механізм обробки помилок на етапі ініціалізації екземплярів усіх класів (кожен клас описує окремий тип помилки);

class Mathematics {
	
	var x: Double?
	var y: Double?
	
	enum ValidationError: Error {
		case notANumber
		case invalidNumber
	}
	
	init(x: Double?,  y: Double?) throws {
		guard x == x, y == y else {
			throw ValidationError.notANumber
		}
		
		self.x = x
		self.y = y
	}
	
	// MARK: - використутовувався механізм обробки помилок для одного з методів;
	
	func multiplyingElements(_ x: Double, _ y: Double) throws -> Double {
		guard !x.isZero, !y.isZero else {
			throw ValidationError.invalidNumber
		}
		return x * y
	}
	
}


do {
	let _ = try Mathematics(x: 1, y: 2)
	
} catch {
	print("This number is invalid")
}
