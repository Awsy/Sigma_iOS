

import UIKit

class RepositoryTableViewCell: UITableViewCell {
	
	static let identifier = "RepositoryTableViewCell"
	
	let nameLabel: UILabel = {
		let name = UILabel()
		name.font = .systemFont(ofSize: 20, weight: .medium)
		return name
	}()
	
	let descriptionLabel: UILabel = {
		let description = UILabel()
		description.numberOfLines = 0
		description.font = .systemFont(ofSize: 15, weight: .light)
		return description
	}()
	
	let starsLabel: UILabel = {
		let stars = UILabel()
		stars.font = .systemFont(ofSize: 10, weight: .regular)
		return stars
	}()
	
	let avatarImageView: UIImageView = {
		let avatar_url = UIImageView()
		avatar_url.clipsToBounds = true
		avatar_url.contentMode = .scaleAspectFill
		return avatar_url
	}()
	
	override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
		super.init(style: style, reuseIdentifier: reuseIdentifier)
		
		contentView.addSubview(nameLabel)
		contentView.addSubview(descriptionLabel)
		contentView.addSubview(starsLabel)
		contentView.addSubview(avatarImageView)
		
	}
	
	required init?(coder: NSCoder) {
		fatalError()
	}
	
	override func layoutSubviews() {
		super.layoutSubviews()
		
		nameLabel.frame = CGRect(x: 10, y: 0, width: contentView.frame.size.width - 100, height: 60)
		descriptionLabel.frame = CGRect(x: 10, y: 70, width: contentView.frame.size.width - 100, height: contentView.frame.size.height / 2)
		avatarImageView.frame = CGRect(x: contentView.frame.size.width - 10, y: 10, width: 150, height: contentView.frame.size.height / 2)
		starsLabel.frame = CGRect(x: contentView.frame.size.width - 200, y: 90, width: 190, height: contentView.frame.size.height / 2)
	}
	
	override func prepareForReuse() {
		super.prepareForReuse()
		nameLabel.text = nil
		descriptionLabel.text = nil
		avatarImageView.image = nil
		starsLabel.text = nil
	}
	
	func configure(with viewModel: RepositoryViewModel) {
		nameLabel.text = viewModel.name
		descriptionLabel.text = viewModel.description
		starsLabel.text = String(viewModel.stars)
		if let data = viewModel.owner {
			avatarImageView.image = UIImage(data: data)
		} else if let url = viewModel.imageURL {
			URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
				guard let data = data, error == nil else {
					return
				}
				
				viewModel.avatarData = data
				DispatchQueue.main.async {
					self?.avatarImageView.image = UIImage(data: data)
				}
			}.resume()
		}
	}
}


class RepositoryViewModel {
	let name: String
	let description: String
	var owner: Data?
	let imageURL: URL?
	var avatarData: Data?
	let stars: Int
		
	init(name: String, description: String, owner: Data?, imageURL: URL?, avatarData: Data?, stars: Int) {
		self.name = name
		self.description = description
		self.owner = owner
		self.stars = stars
		self.imageURL = imageURL
		self.avatarData = avatarData
	}
}

