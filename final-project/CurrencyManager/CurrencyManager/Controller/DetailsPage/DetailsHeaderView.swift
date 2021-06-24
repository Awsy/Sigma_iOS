
import UIKit

class DetailsHeaderView: UIView {
	
	// MARK: - Outlets
	
	private let contentStackView = UIStackView()
	
	private let titleStackView = UIStackView()
	private let titleLabel = UILabel()
	private let bankImageView = UIImageView()
	
	private let detailsTextView = UITextView()
	
	private let updateLabel = UILabel()
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with viewModel: ViewModel) {
		titleLabel.text = viewModel.title
		bankImageView.sd_setImage(with: viewModel.imageUrl)
		detailsTextView.text = viewModel.details
		updateLabel.attributedText = viewModel.lastUpdate
	}
	
	struct ViewModel {
		let title: String
		let imageUrl: URL
		let details: String
		let lastUpdate: NSAttributedString
	}
	
}

private extension DetailsHeaderView {
	
	func setupView() {
		
		addSubview(contentStackView)
		
		// contentStackView
		contentStackView.snp.makeConstraints { (make) in
			make.edges.equalToSuperview().inset(16)
		}
		contentStackView.axis = .vertical
		contentStackView.spacing = 12
		contentStackView.addArrangedSubview(titleStackView)
		contentStackView.addArrangedSubview(detailsTextView)
		contentStackView.addArrangedSubview(updateLabel)
		
		// titleStackView
		titleStackView.axis = .horizontal
		titleStackView.spacing = 12
		titleStackView.alignment = .center
		titleStackView.addArrangedSubview(titleLabel)
		titleStackView.addArrangedSubview(bankImageView)
		
		// titleLabel
		titleLabel.font = UIFont.systemFont(ofSize: 32, weight: .regular)
		titleLabel.textColor = UIColor(red: 0.255, green: 0.251, blue: 0.259, alpha: 1)
		
		// bankImageView
		bankImageView.snp.makeConstraints { (make) in
			make.width.equalTo(60)
			make.height.equalTo(24)
		}
		bankImageView.contentMode = .scaleAspectFit
		
		// detailsTextView
		detailsTextView.isEditable = false
		detailsTextView.isScrollEnabled = false
		detailsTextView.dataDetectorTypes = .all
		detailsTextView.textColor = UIColor(red: 0.529, green: 0.541, blue: 0.553, alpha: 1)
		detailsTextView.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		detailsTextView.textContainerInset = .zero
		detailsTextView.textContainer.lineFragmentPadding = 0
	}
}
