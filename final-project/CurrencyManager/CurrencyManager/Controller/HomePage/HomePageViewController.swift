
import UIKit
import SnapKit
import CoreLocation

// Main screen: actions: Search, Link, Map, Phone
// Bank-Details screen
// Share screen(this is a semi screen)
// Map screen
// Tutorial screen


class HomePageViewController: UIViewController {
	
	// MARK: - Private properties
	
	private var banks: Banks?
	
	private var viewModels = [HomeCell.ViewModel]()
	
	private var isSearchBarHidden = true
	
	// MARK: - Outlets
	
	private let searchBar = UISearchBar()
	private let tableView = UITableView(frame: .zero, style: .plain)
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		fetchBanks()
	}
	
}

// MARK: - Private

private extension HomePageViewController {
	
	// MARK: - View
	
	func setupView() {
		title = "Banks List"
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "search"), style: .plain, target: self, action: #selector(searchButtonDidTap))
		
		// view
		view.backgroundColor = UIColor(red: 0.949, green: 0.949, blue: 0.949, alpha: 1)
		view.addSubview(tableView)
		
		// searchBar
		searchBar.searchBarStyle = .minimal
		searchBar.placeholder = "Search"
		searchBar.delegate = self
		
		// tableView
		tableView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		tableView.backgroundColor = view.backgroundColor
		tableView.delegate = self
		tableView.dataSource = self
		tableView.register(HomeCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
		tableView.separatorStyle = .none
	}
	
	// MARK: - API
	
	private func fetchBanks() {
		
		guard let url = URL(string: "https://kurstoday.com.ua/api/service/banks-of-ukraine") else {
			print("\(#function) - invalid url")
			return
		}
		
		URLSession.shared.dataTask(with: url) { [weak self] (data, _, error) in
			if let error = error {
				print("request failed. Error: \(error)")
				return
			}
			
			guard let data = data else {
				print("No data")
				return
			}
			
			do {
				let decoder = JSONDecoder()
				decoder.dateDecodingStrategy = .secondsSince1970
				self?.banks = try decoder.decode(Banks.self, from: data)
				
				DispatchQueue.main.async {
					self?.updateViewModels()
				}
			} catch {
				print("\(#function) - request failed. Error: \(error)")
			}
		}.resume()
	}
	
}

// MARK: - UITableViewDataSource

extension HomePageViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! HomeCell
		cell.configure(with: viewModels[indexPath.row])
		cell.delegate = self
		return cell
	}
	
}

// MARK: - UITableViewDelegate

extension HomePageViewController: UITableViewDelegate {
	
	func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
		guard let exchanger = getExchanger(at: indexPath) else {
			return
		}
		let viewController = DetailsViewController(exchanger: exchanger)
		show(viewController, sender: nil)
	}
	
}

// MARK: - UISearchBarDelegate

extension HomePageViewController: UISearchBarDelegate {
	
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		updateViewModels()
	}
	
}

// MARK: - CardCellDelegate

extension HomePageViewController: HomeCellDelegate {
	
	func homeCellDidSelectCall(_ cell: HomeCell) {
		guard let indexPath = tableView.indexPath(for: cell), let exchanger = getExchanger(at: indexPath), let phone = URL(string: "tel://\(exchanger.phone)") else {
			return
		}
		UIApplication.shared.open(phone)
	}
	
	func homeCellDidSelectLink(_ cell: HomeCell) {
		guard let indexPath = tableView.indexPath(for: cell), let exchanger = getExchanger(at: indexPath) else {
			return
		}
		UIApplication.shared.open(exchanger.websiteUrl)
	}
	
	func homeCellDidSelectLocation(_ cell: HomeCell) {
		guard let indexPath = tableView.indexPath(for: cell), let exchanger = getExchanger(at: indexPath) else {
			return
		}
		let viewController = MapViewController(destinationCoordinate: exchanger.addressCoordinate)
		viewController.title = exchanger.name
		show(viewController, sender: nil)
	}
	
}

// MARK: - Private

private extension HomePageViewController {
	
	func getExchanger(at indexPath: IndexPath) -> Exchanger? {
		return banks?.exchangers[indexPath.row]
	}
	
	func viewModel(for exchanger: Exchanger) -> HomeCell.ViewModel {
		return HomeCell.ViewModel(
			title: exchanger.name,
			address: exchanger.address,
			phone: exchanger.phone,
			imageUrl: exchanger.imageUrl
		)
	}
	
	func updateViewModels() {
		guard var exchangers = banks?.exchangers else {
			viewModels.removeAll()
			return
		}
		
		if let searchText = searchBar.text, !searchText.isEmpty {
			exchangers = exchangers.filter { (exchanger) -> Bool in
				exchanger.name.localizedCaseInsensitiveContains(searchText)
			}
		}
		
		viewModels = exchangers.map { viewModel(for: $0) }
		
		tableView.reloadData()
	}
	
	// MARK: - Actions
	
	@objc func searchButtonDidTap() {
		if isSearchBarHidden {
			tableView.tableHeaderView = searchBar
			searchBar.frame.size.height = 44
			isSearchBarHidden = false
		} else {
			tableView.tableHeaderView = nil
			isSearchBarHidden = true
		}
	}
	
	// MARK: - Helpers
	
	enum Constants {
		static let cellIdentifier = "CardCell"
	}
	
}
