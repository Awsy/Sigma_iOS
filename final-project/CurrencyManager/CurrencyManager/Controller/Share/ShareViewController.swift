
import UIKit


class ShareViewController: UIViewController, UIGestureRecognizerDelegate {
	
	// MARK: - Properties
	
	private let exchanger: Exchanger
	
	// MARK: - Outlets
	
	private let containerView =  UIView()
	private let containerStackView = UIStackView()
	
	private let titleLabel = UILabel()
	private let subtitleLabel = UILabel()
	
	private let ratesStackView = UIStackView()
	private let shareButton = UIButton(type: .system)
	
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
		updateView()
		updateRateViews()
	}
	
	
	// MARK: - UIGestureRecognizerDelegate
	
	func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldReceive touch: UITouch) -> Bool {
		return touch.view?.isDescendant(of: containerView) == false
	}
	
}


private extension ShareViewController {
	
	func setupView() {
		
		view.backgroundColor = UIColor(red: 0.255, green: 0.251, blue: 0.259, alpha: 0.6)
		view.addSubview(containerView)
		
		// add background tap gesture
		let tapGesture = UITapGestureRecognizer(target: self, action: #selector(viewDidTap))
		tapGesture.delegate = self
		view.addGestureRecognizer(tapGesture)
		
		// containerView
		containerView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview().inset(16)
			make.centerY.equalToSuperview()
		}
		containerView.backgroundColor = .white
		containerView.layer.cornerRadius = 4
		containerView.clipsToBounds = true
		containerView.addSubview(shareButton)
		containerView.addSubview(containerStackView)
		
		// containerStackView
		containerStackView.snp.makeConstraints { (make) in
			make.top.leading.trailing.equalToSuperview().inset(24)
		}
		containerStackView.axis = .vertical
		containerStackView.spacing = 10
		containerStackView.addArrangedSubview(titleLabel)
		containerStackView.addArrangedSubview(subtitleLabel)
		containerStackView.setCustomSpacing(24, after: subtitleLabel)
		containerStackView.addArrangedSubview(ratesStackView)
		
		// titleLabel
		titleLabel.font = UIFont.systemFont(ofSize: 22, weight: .regular)
		titleLabel.textColor = UIColor(red: 0.255, green: 0.251, blue: 0.259, alpha: 1)
		
		// subtitleLabel
		subtitleLabel.font = UIFont.systemFont(ofSize: 13, weight: .regular)
		subtitleLabel.textColor = UIColor(red: 0.529, green: 0.541, blue: 0.553, alpha: 1)
		subtitleLabel.numberOfLines = 2
		
		// ratesStackView
		ratesStackView.axis = .vertical
		ratesStackView.spacing = 16
		ratesStackView.distribution = .fillEqually
		
		// shareButton
		shareButton.snp.makeConstraints { (make) in
			make.top.equalTo(containerStackView.snp.bottom).offset(36)
			make.leading.trailing.bottom.equalToSuperview()
			make.height.equalTo(64)
		}
		shareButton.backgroundColor = UIColor(red: 0.148, green: 0.728, blue: 0.406, alpha: 1)
		shareButton.tintColor = UIColor(red: 0.9882, green: 0.9882, blue: 0.9686, alpha: 1)
		shareButton.titleLabel?.font =  UIFont.systemFont(ofSize: 18)
		shareButton.setTitle("SHARE", for: .normal)
		shareButton.addTarget(self, action: #selector(shareButtonDidTap), for: .touchUpInside)
	}
	
	func updateView() {
		titleLabel.text = exchanger.name
		subtitleLabel.text = exchanger.address
	}
	
	func updateRateViews() {
		let rates = exchanger.rates
		
		ratesStackView.addArrangedSubview(getRateView(title: "USD", rate: rates.usd))
		ratesStackView.addArrangedSubview(getRateView(title: "EUR", rate: rates.eur))
		ratesStackView.addArrangedSubview(getRateView(title: "RUR", rate: rates.rur))
		ratesStackView.addArrangedSubview(getRateView(title: "GBP", rate: rates.gbp))
		ratesStackView.addArrangedSubview(getRateView(title: "CHF", rate: rates.chf))
		ratesStackView.addArrangedSubview(getRateView(title: "PLN", rate: rates.pln))
	}
	
	func getRateView(title: String, rate: Rates.Rate) -> UIView {
		let titleLabel = UILabel()
		
		titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
		titleLabel.textColor = UIColor(red: 0.29, green: 0.565, blue: 0886, alpha: 1)
		titleLabel.textAlignment = .left
		titleLabel.text = title
		
		let subtitleLabel = UILabel()
		
		subtitleLabel.font = UIFont.systemFont(ofSize: 20, weight: .regular)
		subtitleLabel.textColor = UIColor(red: 0.255, green: 0.251, blue: 0.259, alpha: 1)
		subtitleLabel.textAlignment = .right
		subtitleLabel.text = "\(rate.sell) / \(rate.buy)"
		
		let stackView = UIStackView(arrangedSubviews: [titleLabel, subtitleLabel])
		stackView.axis = .horizontal
		stackView.distribution = .fillEqually
		stackView.spacing = 8
		
		return stackView
	}
	
	@objc func viewDidTap() {
		dismiss(animated: true)
	}
	
	@objc func shareButtonDidTap() {
		let items = ["\(exchanger.name) - \(exchanger.websiteUrl)"]
		let activityViewController = UIActivityViewController(activityItems: items, applicationActivities: nil)
		self.present(activityViewController, animated: true)
	}
	
}
