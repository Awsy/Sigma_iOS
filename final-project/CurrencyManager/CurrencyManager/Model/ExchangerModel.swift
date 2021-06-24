
import Foundation
import CoreLocation

struct Exchanger: Decodable {
	let name: String
	let websiteUrl: URL
	let imageUrl: URL
	let rates: Rates
	
	var address: String {
		return "Ужгород, Закарпатська обл., вул.Минайська 14Б"
	}
	
	var addressCoordinate: CLLocationCoordinate2D  {
		return CLLocationCoordinate2D(latitude: 48.6098219878947, longitude: 22.29053642768447)
	}
	
	var phone: String {
		return "+380445005050"
	}
	
	private enum CodingKeys: String, CodingKey {
		case name
		case websiteUrl = "website"
		case imageUrl = "image"
		case rates
	}
	
}
