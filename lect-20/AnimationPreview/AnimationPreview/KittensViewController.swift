
import UIKit

// К сожалению за этот пункт -- провал :(

class KittensViewController: UIViewController {

	let layer = CAShapeLayer()

	let image = UIImage(named: "1.jpg")
	let image2 = UIImage(named: "2.jpg")
	let image3 = UIImage(named: "3.jpg")
	let image4 = UIImage(named: "4.jpg")
	let image5 = UIImage(named: "5.jpg")

	override func viewDidLoad() {
		super.viewDidLoad()

		navigationItem.title = "Random Kitties"
		
		let squareCenter = CGPoint(x: 200, y: 200)
		let square = squarePathWithCenter(center: squareCenter, side: 100)
		layer.path = square.cgPath
		layer.fillColor = UIColor.red.cgColor
		self.view.layer.addSublayer(layer)
	}


	override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
		let touch = touches.first
		let point = touch!.location(in: self.view)
		if layer.path!.contains(point) {
			print ("Tapped on Screen")
		}
	}
	
	func squarePathWithCenter(center: CGPoint, side: CGFloat) -> UIBezierPath {
		let squarePath = UIBezierPath()
		let startX = center.x - side / 2
		let startY = center.y - side / 2
		squarePath.move(to: CGPoint(x: startX, y: startY))
		squarePath.addLine(to: squarePath.currentPoint)
		squarePath.addLine(to: CGPoint(x: startX + side, y: startY))
		squarePath.addLine(to: squarePath.currentPoint)
		squarePath.addLine(to: CGPoint(x: startX + side, y: startY + side))
		squarePath.addLine(to: squarePath.currentPoint)
		squarePath.addLine(to: CGPoint(x: startX, y: startY + side))
		squarePath.addLine(to: squarePath.currentPoint)
		squarePath.close()
		return squarePath
	}
	
}


