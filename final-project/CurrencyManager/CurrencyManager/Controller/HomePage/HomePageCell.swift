
import UIKit
import SDWebImage
import SnapKit

protocol HomeCellDelegate: AnyObject {
	func homeCellDidSelectCall(_ cell: HomeCell)
	func homeCellDidSelectLocation(_ cell: HomeCell)
	func homeCellDidSelectLink(_ cell: HomeCell)
}

class HomeCell: UITableViewCell {
	
	// MARK: - Properties
	
	weak var delegate: HomeCellDelegate?
	
	// MARK: - Outlets
	
	private let containerView = UIView()
	private let containerStackView = UIStackView()
	
	private let titleStackView = UIStackView()
	private let titleLabel = UILabel()
	private let bankImageView = UIImageView()
	
	private let addressStackView = UIStackView()
	private let addressImageView = UIImageView(image: UIImage(named: "locationSmall"))
	private let addressLabel = UILabel()
	
	private let phoneStackView = UIStackView()
	private let phoneImageView = UIImageView(image: UIImage(named: "phoneSmall"))
	private let phoneLabel = UILabel()
	
	private let bottomContainerView = UIView()
	private let bottomStackView = UIStackView()
	private let linkButton = UIButton(type: .system)
	private let mapButton = UIButton(type: .system)
	private let phoneButton = UIButton(type: .system)
	
	// MARK: - Lifecycle
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	func configure(with viewModel: ViewModel) {
		titleLabel.text = viewModel.title
		addressLabel.text = viewModel.address
		phoneLabel.text = viewModel.phone
		bankImageView.sd_setImage(with: viewModel.imageUrl)
	}
	
	// MARK: - Helpers
	
	struct ViewModel {
		let title: String
		let address: String
		let phone: String
		let imageUrl: URL
	}
	
}

// MARK: - Private

private extension HomeCell {
	
	func setupView() {
		selectionStyle = .none
		backgroundColor = .clear
		contentView.backgroundColor = .clear
		contentView.addSubview(containerView)
		
		// containerView
		containerView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview().inset(16)
			make.top.bottom.equalToSuperview().inset(8)
		}
		containerView.backgroundColor = .white
		containerView.layer.cornerRadius = 4
		containerView.layer.shadowRadius = 4
		containerView.layer.shadowOpacity = 0.25
		containerView.layer.shadowOffset = .zero
		containerView.addSubview(containerStackView)
		containerView.addSubview(bottomContainerView)
		
		// containerStackView
		containerStackView.snp.makeConstraints { (make) in
			make.top.leading.trailing.equalToSuperview().inset(16)
		}
		containerStackView.axis = .vertical
		containerStackView.spacing = 12
		containerStackView.addArrangedSubview(titleStackView)
		containerStackView.addArrangedSubview(addressStackView)
		containerStackView.addArrangedSubview(phoneStackView)
		
		// titleStackView
		titleStackView.axis = .horizontal
		titleStackView.spacing = 8
		titleStackView.addArrangedSubview(titleLabel)
		titleStackView.addArrangedSubview(bankImageView)
		
		// titleLabel
		titleLabel.font = UIFont.systemFont(ofSize: 24, weight: .regular)
		titleLabel.textColor = UIColor(red: 0.255, green: 0.251, blue: 0.259, alpha: 1)
		
		// bankImageView
		bankImageView.snp.makeConstraints { (make) in
			make.width.equalTo(60)
			make.height.equalTo(24)
		}
		bankImageView.contentMode = .scaleAspectFit
		
		// addressStackView
		addressStackView.axis = .horizontal
		addressStackView.spacing = 4
		addressStackView.addArrangedSubview(addressImageView)
		addressStackView.addArrangedSubview(addressLabel)
		
		// addressImageView
		addressImageView.snp.makeConstraints { (make) in
			make.size.equalTo(20)
		}
		
		// addressLabel
		addressLabel.textColor = UIColor(red: 0.529, green: 0.541, blue: 0.553, alpha: 1)
		addressLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		addressLabel.numberOfLines = 2
		
		// phoneStackView
		phoneStackView.axis = .horizontal
		phoneStackView.spacing = 4
		phoneStackView.addArrangedSubview(phoneImageView)
		phoneStackView.addArrangedSubview(phoneLabel)
		
		// phoneImageView
		phoneImageView.snp.makeConstraints { (make) in
			make.size.equalTo(20)
		}
		
		// phoneLabel
		phoneLabel.textColor = UIColor(red: 0.529, green: 0.541, blue: 0.553, alpha: 1)
		phoneLabel.font = UIFont.systemFont(ofSize: 14, weight: .regular)
		
		// bottomContainerView
		bottomContainerView.snp.makeConstraints { (make) in
			make.top.equalTo(containerStackView.snp.bottom).offset(24)
			make.left.right.bottom.equalToSuperview()
			make.height.equalTo(40)
		}
		bottomContainerView.backgroundColor = UIColor(red: 0.953, green: 0.957, blue: 0.961, alpha: 1)
		bottomContainerView.addSubview(bottomStackView)
		
		// bottomStackView
		bottomStackView.snp.makeConstraints { (make) in
			make.centerX.equalToSuperview()
			make.top.bottom.equalToSuperview()
		}
		bottomStackView.axis = .horizontal
		bottomStackView.distribution = .fillEqually
		bottomStackView.alignment = .center
		bottomStackView.spacing = 64
		bottomStackView.addArrangedSubview(linkButton)
		bottomStackView.addArrangedSubview(mapButton)
		bottomStackView.addArrangedSubview(phoneButton)
		
		// linkButton
		linkButton.setImage(UIImage(named: "link"), for: .normal)
		linkButton.tintColor = UIColor(red: 0.29, green: 0.565, blue: 0.886, alpha: 1)
		linkButton.addTarget(self, action: #selector(linkButtonDidTap(_:)), for: .touchUpInside)
		linkButton.snp.makeConstraints { (make) in
			make.size.equalTo(30)
		}
		
		// mapButton
		mapButton.setImage(UIImage(named: "location"), for: .normal)
		mapButton.tintColor = UIColor(red: 0.29, green: 0.565, blue: 0.886, alpha: 1)
		mapButton.addTarget(self, action: #selector(mapButtonDidTap(_:)), for: .touchUpInside)
		mapButton.snp.makeConstraints { (make) in
			make.size.equalTo(30)
		}
		
		// phoneButton
		phoneButton.setImage(UIImage(named: "phone"), for: .normal)
		phoneButton.tintColor = UIColor(red: 0.29, green: 0.565, blue: 0.886, alpha: 1)
		phoneButton.addTarget(self, action: #selector(phoneButtonDidTap(_:)), for: .touchUpInside)
		phoneButton.snp.makeConstraints { (make) in
			make.size.equalTo(30)
		}
	}
	
	// MARK: - Actions
	
	@objc private func linkButtonDidTap(_ sender: UIButton) {
		delegate?.homeCellDidSelectLink(self)
	}
	
	@objc private func mapButtonDidTap(_ sender: UIButton) {
		delegate?.homeCellDidSelectLocation(self)
	}
	
	@objc private func phoneButtonDidTap(_ sender: UIButton) {
		delegate?.homeCellDidSelectCall(self)
	}
	
}
