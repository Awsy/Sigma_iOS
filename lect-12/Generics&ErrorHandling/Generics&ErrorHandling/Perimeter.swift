
import Foundation


extension Figures {
	
	var perimeter: Double? {
		guard ![.unknown, .line].contains(type) else {
			return nil
		}
		
		var perimeter = 0.0
		
		for (index, point) in points.enumerated() {
			let startPoint = point
			let endPoint = points.indices.contains(index + 1) ? points[index + 1] : nil
			
			if endPoint != nil {
				let side = Points.distance(from: startPoint, to: endPoint!)
				
				perimeter += side
			}
		}
		
		perimeter += Points.distance(from: points.first!, to: points.last!)
		
		return perimeter
	}
}
