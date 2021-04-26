
import Foundation

enum Triangle {
	
	case equilateral, isosceles, scalene
}

enum Quadrangle {
	
	case rhombus, rectangle, square
}

enum FigureType: Equatable {
	
	case unknown
	case line
	case triangle(Triangle)
	case quadrangle(Quadrangle)
}

class Figures {
	
	private(set) var points: [Points]
	
	var name: String?
	
	init(points: [Points]) {
		self.points = points
	}
}

