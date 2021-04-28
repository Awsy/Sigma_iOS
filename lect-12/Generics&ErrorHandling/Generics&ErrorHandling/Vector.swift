
import Foundation

class Vector: Line {
	
	func module() -> Double {
		return length
	}
	
	func scalarProduct(with vector: Vector) -> Double {
		let ax = endPoint.x - startPoint.x
		let ay = endPoint.y - startPoint.y
		let bx = vector.endPoint.x - vector.startPoint.x
		let by = vector.endPoint.y - vector.startPoint.y
		
		return (ax * bx) + (ay * by)
	}
	
	func angle(between vector: Vector) -> Double {
		acos((scalarProduct(with: vector) / (module() * vector.module()))) * 180 / .pi
	}
}
