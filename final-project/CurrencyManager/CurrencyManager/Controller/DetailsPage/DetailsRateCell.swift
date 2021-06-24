
import UIKit

class DetailsRateCell: UITableViewCell {
	
	// MARK: - Outlets
	
	private let contentStackView = UIStackView()
	private let codeLabel = UILabel()
	private let nameLabel = UILabel()
	
	private let rateStackView = UIStackView()
	private let sellRateLabel = UILabel()
	private let buyRateLabel = UILabel()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with viewModel: ViewModel) {
		codeLabel.text = viewModel.code
		nameLabel.text = viewModel.name
		sellRateLabel.text = viewModel.sellRate
		buyRateLabel.text = viewModel.buyRate
	}
	
	struct ViewModel {
		let code: String
		let name: String
		let sellRate: String
		let buyRate: String
	}
}

private extension DetailsRateCell {
	
	func setupView() {
		
		selectionStyle = .none
		contentView.addSubview(contentStackView)
		
		// contentStackView
		contentStackView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview().inset(16)
			make.top.bottom.equalToSuperview().inset(12)
		}
		contentStackView.axis = .horizontal
		contentStackView.spacing = 16
		contentStackView.addArrangedSubview(codeLabel)
		contentStackView.addArrangedSubview(nameLabel)
		contentStackView.addArrangedSubview(rateStackView)
		
		// codeLabel
		codeLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		codeLabel.textColor = UIColor(red: 0.255, green: 0.251, blue: 0.259, alpha: 1)
		codeLabel.setContentHuggingPriority(.required, for: .horizontal)
		
		
		// nameLabel
		nameLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		nameLabel.textColor = UIColor(red: 0.529, green: 0.541, blue: 0.553, alpha: 1)
		nameLabel.numberOfLines = 2
		nameLabel.setContentHuggingPriority(.defaultLow, for: .horizontal)
		
		// rateStackView
		rateStackView.snp.makeConstraints { (make) in
			make.width.equalToSuperview().multipliedBy(0.35)
		}
		rateStackView.axis = .vertical
		rateStackView.distribution = .fillEqually
		rateStackView.alignment = .trailing
		rateStackView.addArrangedSubview(sellRateLabel)
		rateStackView.addArrangedSubview(buyRateLabel)
		
		// sellRateLabel
		sellRateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		
		// buyRateLabel
		buyRateLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		
	}
}
