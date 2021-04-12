
import Foundation

// Робота з властивостями.

/*
1- Створити клас Fraction який предствляє собою об’єкт що
описує дробове число
*/


precedencegroup TildaOperatorPrecedence {
	higherThan: MultiplicationPrecedence
}

precedencegroup AdditionOperatorPrecedence {
	lowerThan: RangeFormationPrecedence
	associativity: left
}

precedencegroup MultiplicationOperatorPrecedence {
	higherThan: AdditionOperatorPrecedence
	associativity: left
}

infix operator ~~: TildaOperatorPrecedence
infix operator +: AdditionOperatorPrecedence
infix operator -: AdditionOperatorPrecedence
infix operator /: MultiplicationOperatorPrecedence
infix operator *: MultiplicationOperatorPrecedence

class Fraction: CustomStringConvertible {
	
	var value: Double = 0.0
	var numerator: Int = 0
	var denominator: Int = 0
	
	enum Operation {
		case addition, subtraction, multiplication, division
	}
	
	/*
	2- Клас має мати lazy властивості які повертають
	i. подвоєне значення числа
	ii. потроєне значення числа
	iii. обернений дріб -> inverted fraction
	*/
	
	lazy var doubled = {
		self.numerator * 2
	}
	
	lazy var tripled = {
		self.numerator * 3
	}
	
	lazy var inverted = {
		return (self.numerator / self.denominator) == (self.denominator / self.numerator)
	}
	
	
	/*
	3- Клас має мати computed properties які б
	i. виводили повний опис об’єкту
	ii. виводили значення в десятковому вигляді
	*/
	
	var description: String {
		return "\(numerator)/\(denominator)"
	}
	
	
	/*
	4- Клас має мати subscript (функція на вибір)
	*/
	
	subscript(index: Int) -> Int {
			return denominator / index
	}
	
	/*
	6- Реалізувати в Fraction методи для операцій “+”,“-”,“*” та “/”.
	*/
	
	static func +(num1: Fraction, num2: Fraction) -> Fraction {
		let subValue = num1.value + num2.value
		return Fraction(subValue)
	}
	
	static func -(num1: Fraction, num2: Fraction) -> Fraction {
		let subValue = num1.value - num2.value
		return Fraction(subValue)
	}
	static func *(num1: Fraction, num2: Fraction) -> Fraction {
		let subValue = num1.value * num2.value
		return Fraction(subValue)
	}
	
	static func /(num1: Fraction, num2: Fraction) -> Fraction {
		let subValue = num1.value / num2.value
		return Fraction(subValue)
	}
	
	
	/*
	7- Реалізувати операції порівняння об’єктів типу Fraction (>, <, !=,
	==).
	*/
	
	static func >(num1: Fraction, num2: Fraction) -> Bool {
		return num1.value > num2.value
	}
	
	
	static func <(num1: Fraction, num2: Fraction) -> Bool {
		return num1.value < num2.value
	}
	
	static func !=(num1: Fraction, num2: Fraction) -> Bool {
		return num1.value != num2.value
	}
	
	static func ==(num1: Fraction, num2: Fraction) -> Bool {
		return num1.value == num2.value
	}
	
	
	/*
	8- Описати власний infix оператор »~~». Його призначення - на
	Ваш вибір. Пріоритет - найвищий
	*/
	
	static func ~~(numValue1: Fraction, numValue2: Fraction) -> Fraction {
		return Fraction(sqrt(numValue1.value + sqrt(numValue2.value)))
	}
	
	
	init?(_ numerator: Int, _ denominator: Int) {

		guard denominator != 0 else { return nil }
		guard numerator > Int.min, denominator > Int.min else { return nil }


		self.numerator = numerator
		self.denominator = denominator
	}
	
	init(_ value: Double) {
		self.value = value
	}

	
}


/*
9- Реалізувати можливість проведення операцій над будь-якою
кількістю об’єктів Fraction, врахувавши пріоритет операцій
*/

let num1 = Fraction(0.25)
print(num1)
let num2 = Fraction(33, 12)
print(num2!)
let result = num1 + num2! * num1 ~~ num2!
print(result)


extension Fraction {
	/*
	5- Клас має мати extension з декількома додатковими
	ініціалізаторами (initWith(.... - власні варіанти))
	*/

	convenience init?(index : Double?) {
		guard let x = index else {
			return nil
		}
		self.init(index: x)
	}
}


