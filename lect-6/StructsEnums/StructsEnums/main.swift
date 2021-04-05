
import Foundation


// First task - Geometric primitive "Point"

/*
1- Створити структуру, що описує точку у декартовій (x; y) та полярній
(radius; angle) системі координат за допомогою властивостей, які
недоступні для зміни поза межами структури та надати їм значення
за замовчуванням. Полярні та декартові координаті винести у
окремі структури. Результат - 3 структури: Point, CartesianPoint,
PolarPoint
*/

public struct CartesianPoint {
	var x: Double
	var y: Double
	
}


public struct PolarPoint {
	var radius: Double
	var angle: Double
	
}


public struct Point {
	private var cartesianPoint = CartesianPoint(x: 0.0, y: 0.0)
	private var polarPoint = PolarPoint(radius: 0.0, angle: 0.0)
	
	
	
	/*
	2- Описати два ініціалізатора створення точки за допомогою
	декартових (x; y) та полярних координат (radius; angle). Створення
	точки за допомогою декартових координат автоматично визначає
	полярні координати і навпаки.
	*/
	
	init(cartesianPoint: CartesianPoint) {
		self.cartesianPoint = cartesianPoint
		polarPoint.radius = sqrt(pow(cartesianPoint.x, 2.0) + pow(cartesianPoint.y, 2.0))
		polarPoint.angle = atan(cartesianPoint.x / cartesianPoint.y)
	}
	
	init(polarPoint: PolarPoint) {
		self.polarPoint = polarPoint
		cartesianPoint.x = polarPoint.radius * (cos(polarPoint.angle))
		cartesianPoint.y = polarPoint.radius * (cos(polarPoint.angle))
	}
	//--------------------------------------------------------------------------------------------------------
	
	/*
	3- Описати дві функції, що дозволяють змістити точку у нову позицію
	за координатами у декартовій (x; y) та полярній (radius; angle)
	системах.
	*/
	
	
	mutating func cartesianConversion(pointA: Double, pointB: Double)  {
		polarPoint.radius = sqrt(pow(pointA, 2.0) + pow(pointB, 2.0))
		polarPoint.angle = atan(pointA / pointB)
	}
	
	mutating func polarConversion(lat: Double, long: Double) {
		cartesianPoint.x = lat * (cos(long))
		cartesianPoint.y = lat * (sin(long))
	}
	//--------------------------------------------------------------------------------------------------------

	
	/*
	4- Описати функцію приведення точки до рядкового представлення з
	параметром, який вказує систему координат, у якій повинна бути
	виведена точка (за замовчуванням, декартова система координат).
	
	Describe the function of bringing a point to a string representation with a parameter
	that specifies the coordinate system in which
	the point should be output (by default, the Cartesian coordinate system).
	*/
	
	func toString(_ coordinates: Double) -> String {
		let coordConvert = String(format: "%1f", coordinates)
		return coordConvert
	}
	//--------------------------------------------------------------------------------------------------------

	
}


// Second task - Geometric primitive "Figure"

/*
1- Створити структуру, що описує фігуру на основі точок (структура із
завдання No1). Доступ до списку точок є закритим на зміну з-поза
меж структури.
*/

struct Figure {
	var point: [Point]?
	var polarPoint = [PolarPoint]()
	var cartesianPoint = [CartesianPoint]()
	
	
//
//	init(point: Point) {
//		self.point = point
//	}
	
	
	/*
	4- Описати індексатор (subscript), який повертає точку фігури фігури за
	індексом.
	*/
	subscript(indexPath: Int) -> Point? {
		guard let index = point?[indexPath] else {
			return nil
		}
		return index
	}
	
}


/*
2- Описати перерахування, яке визначає тип фігури (невідомо, точка,
лінія, трикутник, чотирикутних та багатокутник). Описати властивість
фігури, що представляє її тип.
*/

//var value = [Int]()


enum Shape: Int, CaseIterable {
	
	case unknown, point, line, traingle, quadrilateral, polygon
	
	init?(id : Int) {
		switch id {
			case 0: self = .unknown
			case 1: self = .point
			case 2: self = .line
			case 3: self = .traingle
			case 4: self = .quadrilateral
			case 5: self = .polygon
			default: return nil
		}
		
		for value in Shape.allCases {
			print([value])
		}
	}
	
	
}

/*
3- Описати ініціалізатори для створення фігури з допомогою масива
точок, або ряду точок. Тип фігури визначається у момент її
створення.
*/


var pointFigure = Figure.init(point: [.init(cartesian: .init(x: 2.0, y: 3.0))], polarPoint: [.init(radius: 2.0, angle: 5.0)], cartesianPoint: [.init(x: 30.4, y: 2.9)])

var cartesianFigure = Figure.init(point: nil, polarPoint: [.init(radius: 2.0, angle: 5.0)], cartesianPoint: [.init(x: 45.1, y: 1.5)])

