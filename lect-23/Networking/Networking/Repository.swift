
import Foundation


class RepositoryApi {
	
	static let shared = RepositoryApi()
	
	struct ApiConstants {
		static let gitApi = URL(string: "https://api.github.com/search/repositories")
		static let searchApi = "https://api.github.com/search/repositories?q=stars:>=10000&sort=stars&order=desc&q="
	}
	
	private init() {}
	
	public func getRepositories(completion: @escaping (Result<[Items], Error>) -> Void) {
		
		guard let url = ApiConstants.gitApi else {
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				completion(.failure(error))
			} else if let data = data {
				do {
					let result =  try JSONDecoder().decode(RepoResponse.self, from: data)
					print("Repositories: \(result.items.count)")
					completion(.success(result.items))
				} catch {
					completion(.failure(error))
				}
			}
		}
		
		task.resume()
		
	}
	
	
	public func searchRepositories(with query: String, completion: @escaping (Result<[Items], Error>) -> Void) {
		
		let searchText = ApiConstants.searchApi + query
		
		guard let url = URL(string: searchText) else {
			return
		}
		
		let task = URLSession.shared.dataTask(with: url) { data, _, error in
			if let error = error {
				completion(.failure(error))
			} else if let data = data {
				do {
					let result =  try JSONDecoder().decode(RepoResponse.self, from: data)
					print("Repositories: \(result.items.count)")
					completion(.success(result.items))
				} catch {
					completion(.failure(error))
				}
			}
		}
		
		task.resume()
		
	}
	
}

struct RepoResponse: Decodable {
	var items = [Items]()
	
}

struct Items: Decodable {
	
	var name: String
	let description: String?
	let owner: String?
	let stars: Int
	
	private enum CodingKeys: String, CodingKey {
		case name, description, owner
		case stars = "stargazers_count"
	}
	
	struct Name: Decodable {
		let name: String
	}
	
	struct Description: Decodable {
		let description: String
	}
	
	struct Avatar: Decodable {
		let owner: Owner
		
		struct Owner: Decodable {
			let repositoryAvatar: String
			private enum CodingKeys: String, CodingKey {
				case repositoryAvatar = "avatar_url"
			}
		}
	}
	
	struct Stars: Decodable {
		let stars: Int
	}
	
	init(from decoder: Decoder) throws {
		let container = try decoder.container(keyedBy: CodingKeys.self)
		
		let nameInfo = try container.decode(Name.self, forKey: .name)
		let descriptionInfo = try container.decode(Description.self, forKey: .description)
		let imageInfo = try container.decode(Avatar.Owner.self, forKey: .owner)
		let starsInfo = try container.decode(Stars.self, forKey: .stars)
		
		self.name = try container.decode(String.self, forKey: .name)
		self.name = nameInfo.name
		self.description = descriptionInfo.description
		self.owner = imageInfo.repositoryAvatar
		self.stars = starsInfo.stars
		
	}
}







