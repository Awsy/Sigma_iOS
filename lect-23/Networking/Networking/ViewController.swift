
import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UISearchBarDelegate {
	
	let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
	
	var repos = [GitFetchRepository]()
	
	@IBOutlet weak var table: UITableView!
	@IBOutlet weak var searchBar: UISearchBar!
	
	let searchController = UISearchController(searchResultsController: nil)
	var viewModel = [RepositoryViewModel]()
	var items = [Items]()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		table.delegate = self
		table.dataSource = self
		table.register(RepositoryTableViewCell.self, forCellReuseIdentifier: RepositoryTableViewCell.identifier)
		
		navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
		
		fetchingRepository()
	}
	
	// CoreData fetching func
	func getItem() {
		
		do {
			repos = try context.fetch(GitFetchRepository.fetchRequest())
			
			DispatchQueue.main.async {
				self.table.reloadData()
			}
			
			
		} catch {
			print(error)
		}
		
	}
	
	func saveItem(name: String) {
		let newItem = GitFetchRepository(context: context)
		newItem.name = name
		
		do {
			try context.save()
		} catch {
			print(error)
		}
	}
	
	@objc private func didTapAdd() {
		let field = searchBar.text
		self.saveItem(name: field ?? "No search")
	}
	
	func searchText()  {
		navigationItem.searchController = searchController
		searchController.searchBar.delegate = self
	}
	
	func fetchingRepository() {
		RepositoryApi.shared.getRepositories { [weak self] result in
			switch result {
				case .success(let items):
					self?.items = items
					self?.viewModel = items.compactMap({
						RepositoryViewModel(name: $0.name, description: $0.description ?? "No description", owner: $0.owner?.data(using: .utf8), imageURL: .none, avatarData: .none, stars: $0.stars)
					})
					
					DispatchQueue.main.async {
						self?.table.reloadData()
					}
					
				case .failure(let error):
					print(error)
			}
		}
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		table.frame = view.bounds
	}
	
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return repos.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let repo = repos[indexPath.row]
		guard let cell = tableView.dequeueReusableCell(withIdentifier: RepositoryTableViewCell.identifier, for: indexPath) as? RepositoryTableViewCell else {
			fatalError()
		}
		
		cell.configure(with: viewModel[indexPath.row])
		
		cell.textLabel?.text = repo.name
		return cell
	}
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		tableView.deselectRow(at: indexPath, animated: true)
		
	}
	
	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		return 150
	}
	
	func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
		guard let text = searchBar.text, !text.isEmpty else {
			return
		}
		RepositoryApi.shared.searchRepositories(with: text, completion: { [weak self] result in
			switch result {
				case .success(let items):
					self?.items = items
					self?.viewModel = items.compactMap({
						RepositoryViewModel(name: $0.name, description: $0.description ?? "No description", owner: $0.owner?.data(using: .utf8), imageURL: .none, avatarData: .none, stars: $0.stars)
					})
					
					DispatchQueue.main.async {
						self?.table.reloadData()
					}
					
				case .failure(let error):
					print(error)
			}
		})
	}
}

