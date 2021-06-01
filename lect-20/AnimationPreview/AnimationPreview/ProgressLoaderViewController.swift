
import UIKit

class ProgressLoaderViewController: UIViewController {
	
	let shape = CAShapeLayer()
	let progressView: UIProgressView = {
		let progressView = UIProgressView()
		progressView.backgroundColor = .clear
		
		return progressView
	}()
	
	let progress = Progress(totalUnitCount: 100)
	
	let label: UILabel = {
		let label =  UILabel()
		label.textAlignment = .center
		label.text = "___________"
		label.backgroundColor = .clear
	
		return label
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		navigationItem.title = "Loading Ring"
		
		let circularPath = UIBezierPath(arcCenter: view.center, radius: 150, startAngle: -(.pi / 2), endAngle: .pi * 2, clockwise: true)
		
		let percentPath = CAShapeLayer()
		percentPath.path = circularPath.cgPath
		percentPath.fillColor = UIColor.clear.cgColor
		percentPath.lineWidth = 14
		percentPath.strokeColor = UIColor.systemPink.cgColor
		
		view.layer.addSublayer(percentPath)
		
		shape.path = circularPath.cgPath
		shape.lineWidth = 17
		shape.strokeColor = UIColor.cyan.cgColor
		shape.fillColor = UIColor.clear.cgColor
		shape.strokeEnd = 0
		
		view.layer.addSublayer(shape)
		
		let button = UIButton(frame: CGRect(x: 20, y: view.frame.size.height - 230, width: view.frame.size.width - 40, height: 50))
		view.addSubview(button)
		
		button.setTitle("Activate", for: .normal)
		button.backgroundColor = .systemPink
		button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
		
	}
	
	@objc func didTapButton() {
		
		let animation = CABasicAnimation(keyPath: "strokeEnd")
		animation.toValue = 1
		animation.duration = 5
		animation.isRemovedOnCompletion = false
		animation.fillMode = .forwards
		shape.add(animation, forKey: "animation")
		self.progressView.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)

		
		progressView.progress = 0
		progress.completedUnitCount = 0
		Timer.scheduledTimer(withTimeInterval: 0.04, repeats: true) { (timer) in
			guard self.progress.isFinished == false else {
				timer.invalidate()
				return
			}
			
			self.progress.completedUnitCount += 1
			self.progressView.setProgress(Float(self.progress.fractionCompleted), animated: true)
			self.label.text = "\(Int(self.progress.fractionCompleted * 100)) %"
		}
		
		label.sizeToFit()
		view.addSubview(label)
		label.center = view.center
		
		progressView.sizeToFit()
		view.addSubview(progressView)
		progressView.center = view.center
	}
	
}
