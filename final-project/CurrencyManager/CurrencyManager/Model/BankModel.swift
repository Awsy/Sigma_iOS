
import Foundation

struct Banks: Decodable {
	let serviceId: String
	let serviceName: String
	let exchangers: [Exchanger]
}
