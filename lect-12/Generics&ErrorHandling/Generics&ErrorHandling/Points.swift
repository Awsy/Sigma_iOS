
import Foundation

class Points {
	
	var x: Double
	var y: Double
	
	init(_ x: Double, _ y: Double) {
		self.x = x
		self.y = y
	}
	
	static func distance(from firstPoint: Points, to secondPoint: Points) -> Double {
		let x = pow(secondPoint.x - firstPoint.x, 2)
		let y = pow(secondPoint.y - firstPoint.y, 2)
		
		return (x + y).squareRoot()
	}
}
