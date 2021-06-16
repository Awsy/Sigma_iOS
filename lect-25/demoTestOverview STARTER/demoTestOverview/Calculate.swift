
import Foundation

struct Calculate {
	
	private var number: Double?
	
	private var intermediateCalculation: (n1: Double, calcMethod: Operation)?
	
	mutating func setNumber(_ number: Double) {
		self.number = number
	}
	
	mutating func calculate(symbol: Operation) -> Double? {
		
		if let n = number {
			switch symbol {
				case .Clear:
					return 0
				case .ok:
					return performCalculation(n2: n)
				default:
					intermediateCalculation = (n1: n, calcMethod: symbol)
			}
		}
		return nil
	}
	
	private func performCalculation(n2: Double) -> Double? {
		
		if let n1 = intermediateCalculation?.n1,
		   let operation = intermediateCalculation?.calcMethod {
			
			switch operation {
				case .plus:
					return n1 + n2
				case .minus:
					return n1 - n2
				case .multiply:
					return n1 * n2
				case .divide:
					return n1 / n2
				default:
					fatalError("The operation passed in does not match any of the cases.")
			}
		}
		return nil
	}
}
