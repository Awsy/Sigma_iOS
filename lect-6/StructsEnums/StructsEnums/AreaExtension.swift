
import Foundation

/*
5- Описати розширення (в іншому файлі), де визначити дві функції типу,
які обраховують та повертають площу, а також периметер фігури.
*/

extension Figure {
	
	func calculateArea(length: Double, width: Double) -> Double {
		let area = length * width
		return area
	}
	
	func calculatePerimeter(length: Double, width: Double) -> Double {
		let perimeter = sqrt(length + width)
		return perimeter
	}
	
}

/*
6- Описати властивості (у файлі підпункта 5), що повертають площу та
периметер фігури.
*/

// К сожалению не смог решить этот пункт
