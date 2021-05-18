

import UIKit
import Foundation

class ViewController: UIViewController {
	
	
	// MARK: - 1. Створити свій підклас UIView 2. Реалізувати так, щоб при додаванні цього класу до інтерфейсу було видно наступне
	let containerView: UIView = {
		let view = UIView()
		view.backgroundColor = .clear
		return view
	}()
	
	let containerView2: UIView = {
		let view = UIView()
		view.backgroundColor = .clear
		return view
	}()
	
	let containerView3: UIView = {
		let view = UIView()
		view.backgroundColor = .clear
		return view
	}()
	
	let containerView4: UIView = {
		let view = UIView()
		view.backgroundColor = .clear
		return view
	}()
	
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		
		containerView.frame = CGRect(x: view.frame.width/2 - 10.5, y: view.frame.height/2 - 250, width: 40, height: 40)
		containerView2.frame = CGRect(x: view.frame.width/2 - 30, y: view.frame.height/2 - 270, width: 80, height: 80)
		containerView3.frame = CGRect(x: view.frame.width/2 - 59, y: view.frame.height/2 - 300, width: 140, height: 140)
		
		
		// MARK: - Створити свої окремі підкласи UIView
		let layer = CAGradientLayer()
		layer.frame = CGRect(x: 5, y: 320, width: 400, height: 90)
		layer.colors = [UIColor.white.cgColor, UIColor.black.cgColor]
		layer.startPoint = CGPoint(x:1.0, y:0.9)
		layer.borderWidth = 1
		layer.borderColor = UIColor.gray.cgColor
		layer.endPoint = CGPoint(x:0.0, y:0.9)
		
		
		
		view.addSubview(containerView)
		view.addSubview(containerView2)
		view.addSubview(containerView3)
		view.addSubview(containerView4)
		
		view.layer.addSublayer(layer)
		
		drawBigRedCircle()
		drawFlowerShape()
	}
	
	private func drawRedCircle() {
		
		let path = UIBezierPath(ovalIn: containerView.bounds)
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.fillColor = UIColor.red.cgColor
		
		containerView.layer.addSublayer(shapeLayer)
		
	}
	
	private func drawBlueCircle() {
		
		let path = UIBezierPath(ovalIn: containerView2.bounds)
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.lineWidth = 15
		shapeLayer.strokeColor = UIColor.systemBlue.cgColor
		
		containerView2.layer.addSublayer(shapeLayer)
		drawRedCircle()
	}
	
	private func drawBigRedCircle() {
		
		let path = UIBezierPath(ovalIn: containerView3.bounds)
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.fillColor = UIColor.clear.cgColor
		shapeLayer.lineWidth = 15
		shapeLayer.strokeColor = UIColor.systemRed.cgColor
		
		containerView3.layer.addSublayer(shapeLayer)
		drawBlueCircle()
	}
	
	// MARK: - 1. Створити свій підклас UIView 2. “Намалювати” квітку
	
	private func drawFlowerShape() {
		
		
		
		let path = UIBezierPath()
		path.move(to: CGPoint(x: 0, y: 200))

		path.addLine(to: CGPoint(x: 0, y: 125))
		path.addLine(to: CGPoint(x: 50, y: 125))
		path.addLine(to: CGPoint(x: 50, y: 75))
		path.addLine(to: CGPoint(x: 0, y: 75))
		path.addLine(to: CGPoint(x: 0, y: 0))

		path.addLine(to: CGPoint(x: 75, y: 0))
		path.addLine(to: CGPoint(x: 75, y: 50))
		path.addLine(to: CGPoint(x: 125, y: 50))
		path.addLine(to: CGPoint(x: 125, y: 0))
		path.addLine(to: CGPoint(x: 200, y: 0))

		path.addLine(to: CGPoint(x: 200, y: 75))
		path.addLine(to: CGPoint(x: 150, y: 75))
		path.addLine(to: CGPoint(x: 150, y: 125))
		path.addLine(to: CGPoint(x: 200, y: 125))
		path.addLine(to: CGPoint(x: 200, y: 200))

		path.addLine(to: CGPoint(x: 125, y: 200))
		path.addLine(to: CGPoint(x: 125, y: 150))
		path.addLine(to: CGPoint(x: 75, y: 150))
		path.addLine(to: CGPoint(x: 75, y: 200))
		path.addLine(to: CGPoint(x: 0, y: 200))
		
		
		let shapeLayer = CAShapeLayer()
		shapeLayer.path = path.cgPath
		shapeLayer.strokeColor = UIColor.systemGreen.cgColor
		shapeLayer.lineWidth = 2
		shapeLayer.fillColor = UIColor.systemPink.cgColor
		shapeLayer.frame = CGRect(x: view.frame.width/2 - 90, y: view.frame.height/2 - 3, width: 140, height: 140)
		
		containerView4.layer.addSublayer(shapeLayer)
	}
	
	
}



