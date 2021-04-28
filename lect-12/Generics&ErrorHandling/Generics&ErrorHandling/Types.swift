
import Foundation

extension Figures {
	
	var type: FigureType {
		switch points.count {
			case 2:
				return .line
			case 3:
				let ab = Line(withStartPoint: points[0], andEndPoint: points[1])
				let bc = Line(withStartPoint: points[1], andEndPoint: points[2])
				let ac = Line(withStartPoint: points[0], andEndPoint: points[2])
				
				if ab.length == bc.length && bc.length == ac.length && ab.length == ac.length {
					return .triangle(.equilateral)
				} else if ab.length == bc.length || ab.length == ac.length || bc.length == ac.length {
					return .triangle(.isosceles)
				}
				
				return .triangle(.scalene)
			case 4:
				let ab = Line(withStartPoint: points[0], andEndPoint: points[1])
				let bc = Line(withStartPoint: points[1], andEndPoint: points[2])
				let cd = Line(withStartPoint: points[2], andEndPoint: points[3])
				let ad = Line(withStartPoint: points[0], andEndPoint: points[3])
				
				let A = ab.vector.angle(between: bc.vector)
				let B = bc.vector.angle(between: cd.vector)
				let C = cd.vector.angle(between: ad.vector)
				let D = ad.vector.angle(between: ab.vector)
				
				func isSidesEqual(_ a: Line, _ b: Line, _ c: Line, _ d: Line) -> Bool {
					a.length == b.length && a.length == c.length && a.length == d.length
				}
				
				func isAnglesEqual(_ a: Double, _ b: Double, _ c: Double, _ d: Double) -> Bool {
					a == b && a == c && a == d
				}
				
				if isSidesEqual(ab, bc, cd, ad) && isAnglesEqual(A, B, C, D) {
					return .quadrangle(.square)
				} else if isSidesEqual(ab, bc, cd, ad) && !isAnglesEqual(A, B, C, D) {
					return .quadrangle(.rhombus)
				}
				
				return .quadrangle(.rectangle)
			default:
				return .unknown
		}
	}
}

