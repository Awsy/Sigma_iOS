
import Foundation


/*
7- Описати розширення (у окремому файлі підпункта 7), де визначити чотири функції типу, які повертають створену точку на основі декартових (x; y) та полярних (radius; angle) координат, а також користувацьких типів CartesianCoordinates та PolarCoordinates.
*/

public extension Point {
	func xyFunction(x: Double, y: Double) -> Double {
		return x + y
	}
	
	func angleRadius(angle: Double, radius: Double) -> Double{
		return angle + radius
	}
	
	func cartesians(cartesian: CartesianPoint) -> CartesianPoint{
		return cartesian
	}
	
	func polars(polar: PolarPoint) -> PolarPoint {
		return polar
	}
}


