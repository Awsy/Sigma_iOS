
import Foundation

class Line: Figures {
	
	var startPoint: Points
	
	var endPoint: Points
	
	var length: Double {
		Points.distance(from: startPoint, to: endPoint)
	}
	
	var vector: Vector {
		Vector(withStartPoint: startPoint, andEndPoint: endPoint)
	}
	
	init(withStartPoint startPoint: Points, andEndPoint endPoint: Points) {
		self.startPoint = startPoint
		self.endPoint = endPoint
		
		super.init(points: [startPoint, endPoint])
	}
}
