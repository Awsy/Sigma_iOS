

import UIKit


class SettingsViewController: UIViewController {
	
	@IBOutlet weak var button1: UIButton!
	@IBOutlet weak var button2: UIButton!
	
	@IBOutlet weak var switcher: UISwitch!
	@IBOutlet weak var label: UILabel!
	
	@IBAction func themeSwitcher(_ sender: UISwitch) {
		if switcher.isOn == true {
			view.backgroundColor = UIColor.black
			label.textColor = UIColor.white
			button1.setTitleColor(.white, for: .normal)
			button2.setTitleColor(.white, for: .normal)
		} else {
			view.backgroundColor = UIColor.white
			label.textColor = UIColor.black
			button1.setTitleColor(.black, for: .normal)
			button2.setTitleColor(.black, for: .normal)
		}
	}
	override func viewDidLoad() {
		super.viewDidLoad()

		
	}
	
	
}


