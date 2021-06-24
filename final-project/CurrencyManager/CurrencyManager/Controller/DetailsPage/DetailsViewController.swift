
import UIKit
import Floaty

class DetailsViewController: UIViewController {
	
	// MARK: - Properties
	
	private let exchanger: Exchanger
	
	private let dateFormatter: DateFormatter = {
		let formatter = DateFormatter()
		formatter.dateFormat = "HH:mm dd.mm.yyyy"
		return formatter
	}()

	private var viewModels = [DetailsRateCell.ViewModel]()

	// MARK: - Outlets

	private let headerView = DetailsHeaderView()
	private let tableView  =  UITableView(frame: .zero, style: .plain)
	private let floatyButton = Floaty()
	
	
	init(exchanger: Exchanger) {
		self.exchanger = exchanger
		super.init(nibName: nil, bundle: nil)
	}


	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
	}
	
	override func viewDidLayoutSubviews() {
		super.viewDidLayoutSubviews()
		updateHeaderViewSize()
	}

}

// MARK: - UITableViewDataSource

extension DetailsViewController: UITableViewDataSource {
	
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModels.count
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		
		let cell = tableView.dequeueReusableCell(withIdentifier: Constants.cellIdentifier, for: indexPath) as! DetailsRateCell
		cell.configure(with: viewModels[indexPath.row])
		return cell
	}
	
	
}

extension DetailsViewController: UITableViewDelegate {
	func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: Constants.headerIdentifier)
		return view
	}
	
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		return 56
	}
}

private extension DetailsViewController {
	
	func setupView() {
		
		title = exchanger.name
		navigationItem.rightBarButtonItem = UIBarButtonItem(image: UIImage(named: "share"), style: .plain, target: self, action: #selector(shareButtonDidTap))
		
		// view
		view.addSubview(tableView)
		view.addSubview(floatyButton)
		
		// tableView
		tableView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview()
		}
		tableView.register(DetailsSectionHeaderView.self, forHeaderFooterViewReuseIdentifier: Constants.headerIdentifier)
		tableView.register(DetailsRateCell.self, forCellReuseIdentifier: Constants.cellIdentifier)
		tableView.tableHeaderView = headerView
		tableView.dataSource = self
		tableView.delegate = self
		
		// headerView
		let headerViewModel = DetailsHeaderView.ViewModel(title: exchanger.name, imageUrl: exchanger.imageUrl, details: getDetails(), lastUpdate: getLastUpdateText())
		headerView.configure(with: headerViewModel)
		
		// floatyButton
		floatyButton.size = 60
		floatyButton.itemSize = 60
		floatyButton.buttonColor = UIColor(red: 0.148, green: 0.728, blue: 0.406, alpha: 1)
		floatyButton.buttonImage = UIImage(named: "menu")
		
		floatyButton.addItem("Дзвінок", icon: UIImage(named: "floatyPhone"), handler: { _ in
			guard let phone = URL(string: "tel://\(self.exchanger.phone)") else {
				return
			}
			UIApplication.shared.open(phone)
		})
		floatyButton.addItem("Карта", icon: UIImage(named: "floatyMap"), handler: { _ in
			let viewController = MapViewController(destinationCoordinate: self.exchanger.addressCoordinate)
			viewController.title = self.exchanger.name
			self.show(viewController, sender: nil)
		})
		floatyButton.addItem("Сайт", icon: UIImage(named: "floatySite"), handler: { _ in
		
			UIApplication.shared.open(self.exchanger.websiteUrl)
		
		})
		
		updateViewModels()
		
	}
	
	func getDetails() -> String {
		
		return """
		Oфіційний сайт: \(exchanger.websiteUrl)
		Інтернет-банкінг: My Alfa-Bank
		Адреса: \(exchanger.address)
		Гаряча лінія: 0 800 50 500 50 (цілодобово без вихідних)
		Телефон: 044 93 816 15
		Телефон: 044 93 098 34 (дзвінки з-за кордону)
		e-mail: ccd@alfabank.kiev.ua
		"""
	}
	
	func getLastUpdateText() -> NSAttributedString {
		
		let attributedString = NSMutableAttributedString(string: "Інформація актуальна на: ", attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular), .foregroundColor: UIColor(red: 0.529, green: 0.541, blue: 0.553, alpha: 1)])
		let dateAttributedString = NSAttributedString(string: dateFormatter.string(from: exchanger.rates.updateTime), attributes: [.font: UIFont.systemFont(ofSize: 16, weight: .regular), .foregroundColor: UIColor(red: 0.255, green: 0.251, blue: 0.259, alpha: 1)])
		attributedString.append(dateAttributedString)
		return attributedString
	}
	
	func getViewModel(for rate: Rates.Rate, code: String, name: String) -> DetailsRateCell.ViewModel {
		return DetailsRateCell.ViewModel(code: code, name: name, sellRate: rate.sell, buyRate: rate.buy)
	}
	
	func updateViewModels() {
		
		let rates = exchanger.rates
		viewModels = [
			getViewModel(for: rates.usd, code: "USD", name: "Долар США"),
			getViewModel(for: rates.eur, code: "EUR", name: "Євро"),
			getViewModel(for: rates.rur, code: "RUR", name: "Pocійський Рубль"),
			getViewModel(for: rates.gbp, code: "GBP", name: "Англійський Фунт Стерлінгів"),
			getViewModel(for: rates.chf, code: "CHF", name: "Швейцарський франк"),
			getViewModel(for: rates.pln, code: "PLN", name: "Польський Злотий")
		]
		
		tableView.reloadData()
	}
	
	func updateHeaderViewSize() {
		
		let size = headerView.systemLayoutSizeFitting(tableView.bounds.size, withHorizontalFittingPriority: .required, verticalFittingPriority: .fittingSizeLevel)
		
		if size.height != headerView.bounds.height {
			headerView.frame.size = size
			tableView.tableHeaderView = headerView
		}
		
	}
	
	@objc func shareButtonDidTap() {
		let viewController = ShareViewController(exchanger: exchanger)
		viewController.modalPresentationStyle = .overFullScreen
		viewController.modalTransitionStyle = .crossDissolve
		present(viewController, animated: true)
	}
	
	enum Constants {
		static let headerIdentifier = "DetailsSectionHeaderView"
		static let cellIdentifier = "DetailsRateCell"
	}
	
}
