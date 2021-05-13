
import Foundation

/*
5- Описати розширення (в іншому файлі), де визначити функцію типу,
яка повертає відстань між двома точками.
*/

public extension Point {
	
	func distanceMeasure(from: Double, to: Double) -> Double {
		let distance = from.distance(to: to)
		return distance
	}
	
}
//--------------------------------------------------------------------------------------------------------

