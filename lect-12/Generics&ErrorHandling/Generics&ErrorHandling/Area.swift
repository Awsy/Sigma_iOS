//
//import Foundation
//
//extension Figures {
//	
//	var area: Double? {
//		guard ![.unknown, .line].contains(type) else {
//			return nil
//		}
//		
//		let xx = points.map({ $0.x })
//		let yy = points.map({ $0.y })
//		
//		let overlace = zip(xx, yy.dropFirst() + yy.prefix(1)).map({ $0.0 * $0.1 }).reduce(0, +)
//		let underlace = zip(yy, xx.dropFirst() + xx.prefix(1)).map({ $0.0 * $0.1 }).reduce(0, +)
//		
//		return abs(overlace - underlace) / 2
//	}
//}
