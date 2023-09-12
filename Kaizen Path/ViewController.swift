import UIKit

class ViewController: UIViewController {
    
    let shapeLayer = CAShapeLayer()
    let trackLayer = CAShapeLayer()
    var timeRemaning: Int = 5
    var timer: Timer!
    
    @IBOutlet weak var timerLabel: UILabel!
    
    @IBAction func didTapStartButton(_ sender: UIButton) {
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.duration = 6
        basicAnimation.fillMode = CAMediaTimingFillMode.forwards
        basicAnimation.isRemovedOnCompletion = false
        
        shapeLayer.add(basicAnimation, forKey: "start")
        
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(step), userInfo: nil, repeats: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.layer.addSublayer(trackLayer)
        view.layer.addSublayer(shapeLayer)
        
        timerLabel.text = "5"
        let center = view.center
        
        let circularPath = UIBezierPath(arcCenter: center, radius: 150, startAngle: -CGFloat.pi / 2, endAngle: 2 * CGFloat.pi, clockwise: true)
        
        trackLayer.path = circularPath.cgPath
        trackLayer.strokeColor = UIColor.gray.cgColor
        trackLayer.lineWidth = 12
        trackLayer.fillColor = UIColor.clear.cgColor
        trackLayer.lineCap = CAShapeLayerLineCap.round
        
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.white.cgColor
        shapeLayer.lineWidth = 12
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        shapeLayer.lineCap = CAShapeLayerLineCap.round
        
    }
    
    @objc func step() {
        if timeRemaning > 0 {
            timeRemaning -= 1
        } else {
            timer.invalidate()
            timeRemaning = 5
        }
        timerLabel.text = "\(timeRemaning)"
        
    }
    
    
    
}

