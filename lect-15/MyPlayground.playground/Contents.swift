
import UIKit
import PlaygroundSupport

// MARK:  - Створити View-based playground.


class MyViewController : UIViewController {
	
	override func loadView() {
		let view = UIView()
		view.backgroundColor = .lightGray
		
		let button = UIButton(type: .custom)
		button.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
		button.setTitle("Change View", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.isUserInteractionEnabled = true
		button.backgroundColor = .cyan
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
		
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		
		self.view = view
	}
	
	
	// MARK: - Реалізувати рух UIView використавши механізми Responder Chain.
	@objc
	private func buttonDidTap() {
		let controller = DetailViewController()
		present(controller, animated: true, completion: nil)
	}
	
}


// MARK: - Реалізувати механізм Target-Action (event на вибір)

class DetailViewController: UIViewController {
	
	// MARK: - Додати UIView (UIView-1) об’єктна view створеного UIViewController. BackgroundColor - на вибір (головне щоб було добре видно об’єкт)
	override func loadView() {
		let view = UIView()
		view.backgroundColor = .systemPink
		
		let button = UIButton(type: .custom)
		button.frame = CGRect(x: 0, y: 0, width: 200, height: 20)
		button.setTitle("Dismiss View", for: .normal)
		button.setTitleColor(.black, for: .normal)
		button.isUserInteractionEnabled = true
		button.backgroundColor = .cyan
		button.setTitleColor(.black, for: .normal)
		button.layer.cornerRadius = 5
		button.layer.borderWidth = 1
		button.addTarget(self, action: #selector(buttonDidTap), for: .touchUpInside)
		
		view.addSubview(button)
		
		button.translatesAutoresizingMaskIntoConstraints = false
		button.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
		button.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
		
		view.addSubview(button)
		self.view = view
	}
	
	
	// MARK: - Додати на UIView-1 ще один об’єкт UIButton
	@objc
	private func buttonDidTap() {
		dismiss(animated: true, completion: nil)
	}
	
	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		
		// MARK: - Вивести в логи за допомогою функції print frame та bounds створених об’єктів. Зрозуміти залежність і позиції об’єктів.
		print("finger touched the screen...")
		
	}
	
	
}

// Present the view controller in the Live View window
PlaygroundPage.current.liveView = MyViewController()


