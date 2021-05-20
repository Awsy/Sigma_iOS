
import UIKit

class ViewController: UIViewController {
	
	var imageView = UIImageView()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		let imageName = "cat.png"
		let image = UIImage(named: imageName)
		imageView = UIImageView(image: image!)
		imageView.frame = CGRect(x: 50, y: 100, width: 300, height: 200)
		
		
		let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
		label.center = CGPoint(x: 200, y: 360)
		label.textAlignment = .center
		label.layer.borderColor = UIColor.black.cgColor
		label.layer.borderWidth = 1
		label.text = "I'm happy cat"
		
		let button = UIButton(frame: CGRect(x: 0, y: 0, width: 200, height: 40))
		button.center = CGPoint(x: 200, y: 500)
		button.setTitle("Let cat smile!", for: .normal)
		button.setTitleColor(.systemBlue, for: .normal)
		button.addTarget(self, action: #selector(buttonAction), for: .touchUpInside)
		
		self.view.addSubview(label)
		self.view.addSubview(button)
		self.view.addSubview(imageView)
		
		
	}
	
	
	@objc func buttonAction(button: UIButton) {
		imageView.image = UIImage(named:"cat2.jpeg")
		button.setTitle("Button pressed", for: .normal)
	}
	
	
}


extension UITableView {
	func setEmptyView(title: String, message: String) {
		let emptyView = UIView(frame: CGRect(x: self.center.x, y: self.center.y, width: self.bounds.size.width, height: self.bounds.size.height))
		emptyView.backgroundColor = .cyan
		let titleLabel = UILabel()
		let messageLabel = UILabel()
		titleLabel.translatesAutoresizingMaskIntoConstraints = false
		messageLabel.translatesAutoresizingMaskIntoConstraints = false
		titleLabel.textColor = UIColor.black
		titleLabel.font = UIFont(name: "HelveticaNeue-Bold", size: 25)
		messageLabel.textColor = UIColor.lightGray
		messageLabel.font = UIFont(name: "HelveticaNeue-Regular", size: 23)
		emptyView.addSubview(titleLabel)
		emptyView.addSubview(messageLabel)
		titleLabel.centerYAnchor.constraint(equalTo: emptyView.centerYAnchor).isActive = true
		titleLabel.centerXAnchor.constraint(equalTo: emptyView.centerXAnchor).isActive = true
		messageLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 20).isActive = true
		messageLabel.leftAnchor.constraint(equalTo: emptyView.leftAnchor, constant: 20).isActive = true
		messageLabel.rightAnchor.constraint(equalTo: emptyView.rightAnchor, constant: -20).isActive = true
		titleLabel.text = title
		messageLabel.text = message
		messageLabel.numberOfLines = 0
		messageLabel.textAlignment = .center

		let imgView = UIImageView()
		imgView.translatesAutoresizingMaskIntoConstraints = false
		if let img = UIImage(named: "s1") {
			imgView.image = img
		}
		emptyView.addSubview(imgView)
		NSLayoutConstraint.activate([
			imgView.bottomAnchor.constraint(equalTo: titleLabel.topAnchor, constant: 0.0),
			imgView.centerXAnchor.constraint(equalTo: titleLabel.centerXAnchor, constant: 0.0),
			imgView.widthAnchor.constraint(equalToConstant: 50.0),
			imgView.heightAnchor.constraint(equalTo: imgView.widthAnchor, multiplier: 1.0),
		])

		self.backgroundView = emptyView
		self.separatorStyle = .none
	}
	func restore() {
		self.backgroundView = nil
		self.separatorStyle = .singleLine
	}
}
