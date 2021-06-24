//
//  DetailsSectionHeaderView.swift
//  CurrencyManager
//
//  Created by Aws Shkara on 12.06.2021.
//

import UIKit

class DetailsSectionHeaderView: UITableViewHeaderFooterView {
	
	// MARK: - Outlets
	
	private let contentStackView = UIStackView()
	private let currencyLabel = UILabel()
	private let rateLabel = UILabel()
	
	
	override init(reuseIdentifier: String?) {
		super.init(reuseIdentifier: reuseIdentifier)
		
		setupView()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

private extension DetailsSectionHeaderView {
	
	func setupView() {
		contentView.addSubview(contentStackView)
		
		// contentStackView
		contentStackView.snp.makeConstraints { (make) in
			make.leading.trailing.equalToSuperview().inset(16)
			make.top.bottom.equalToSuperview().inset(8)
		}
		contentStackView.axis = .horizontal
		contentStackView.distribution = .fillProportionally
		contentStackView.addArrangedSubview(currencyLabel)
		contentStackView.addArrangedSubview(rateLabel)
		
		// currencyLabel
		currencyLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		currencyLabel.textColor = UIColor(red: 0.698, green: 0.71, blue: 0.722, alpha: 1)
		currencyLabel.text = "Назва Валюти"
		currencyLabel.textAlignment = .left
		
		// rateLabel
		rateLabel.font = UIFont.systemFont(ofSize: 16, weight: .regular)
		rateLabel.textColor = UIColor(red: 0.698, green: 0.71, blue: 0.722, alpha: 1)
		rateLabel.text = "Покупка / Продаж"
		rateLabel.textAlignment = .right
	}
}
