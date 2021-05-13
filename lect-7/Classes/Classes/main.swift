
import Foundation

// Classes task

/*
1- Описати клас Figure, що представляє фігуру лише на основі точок (інший клас
Point) та деякої назви, задання якої є необов’язковим.
*/

class Point {
	
	/*
	2- Кожна фігура повинна визначати свої периметр та площу.
	*/
	var width: Double = 0.0
	var length: Double = 0.0
	var area: Double {
		return width * length
	}
	var perimeter: Double {
		return sqrt(width + length)
	}
	
}

class Figure {
	
	/*
	3- Фігури бувають наступних видів (enum): невідома, лінія, трикутник та
	чотирикутник. Таку інформацію фігура має надати у залежності від кількости
	точок.
	*/
	enum Shape {
		case undefined
		case line
		case triangle
		case quadrangle
	}
}


/*
4- Описати класи, що представляють лінію, трикутник та чотирикутник
(успадковані типи від Figure).
*/

class Line: Figure {
	
	/*
	5- Лінія - це фігура з двох точок, які називаються початковою та кінцевою точками.
	Лінія визначає відстань між такими точками (computed property). Кожна лінія
	визначає свій вектор.
	*/
	var start: Double
	var end: Double
	
	
	subscript(index: Double) -> Double {
		get {
			return toPoint(value: index)
		}
		set(end) {
			self.end = fromPoint(value: index)
		}
	}
	
	func fromPoint(value: Double) -> Double {
		return value
	}
	
	func toPoint(value: Double) -> Double {
		return value.distance(to: fromPoint(value: value))
	}
	
	
	init(start: Double, end: Double) {
		self.start = start
		self.end = end
	}
	
}


/*
6- Описати клас Вектор, що харакатеризує лінію (дві точки). Вектор визначає свій
модуль (func), а також скалярний добуток (func). Вектор дозволяє визначити
кут між собою та іншим вектором (func).
*/

class Vector {
	var pointA: Double = 0.0
	var pointB: Double = 0.0
	
	func lineCalc(pointA: Double, pointB: Double) -> Double {
		return pointA * pointB
	}
}



/*
7- Трикутник - це фігура з трьох точок. Сума усіх кутів трикутника, як відомо,
складає 180 градусів (init?). Трикутники за типом (enum with tuple as assosiated
type) довжини сторін поділяються на рівносторонні, рівнобедренні та
нерівносторонні, а за типом кута поділяються на гострокутні, прямокутні,
тупокутні.
*/
class Triangle: Figure {
	enum LineType {
		case line1(Double,Double)
		case line2(Double,Double)
		case line3(Double,Double)
	}
}

/*
8- Чотирикутник - це фігура з чотирьох точок. Сума усіх кутів чотирикутника, як
відомо, складає 360 градусів(init?). Чотирикутники поділяються на ромби,
прямокутники та квадрати (enum).
*/

class Quadrangle: Figure {
	enum LineType {
		case line1(Double)
		case line2(Double)
		case line3(Double)
		case line4(Double)
	}
}


// 9- к сожалению не успел(
