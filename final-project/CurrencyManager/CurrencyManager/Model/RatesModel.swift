
import Foundation

struct Rates: Decodable {
	let updateTime: Date
	
	let usd: Rate
	let eur: Rate
	let rur: Rate
	let gbp: Rate
	let chf: Rate
	let pln: Rate
	
	struct Rate: Decodable {
		let buy: String
		let sell: String
		
		private enum CodingKeys: String, CodingKey {
			case buy
			case sell = "sel"
		}
	}
}
