//
//  ViewController.swift
//  DrawLineGraphTimer
//
//  Created by Tyobigoro on 2018/05/27.
//  Copyright © 2018年 Tyobigoro. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var firstView: UIView!
    @IBOutlet weak var secondView: UIView!
    @IBOutlet weak var thirdView: UIView!
    @IBOutlet weak var fourthView: UIView!
    
    @IBOutlet weak var firstGraphView: UIView!
    @IBOutlet weak var secondGraphView: UIView!
    @IBOutlet weak var thirdGraphView: UIView!
    @IBOutlet weak var fourthGraphView: UIView!
    
    @IBOutlet weak var firstTapView: UIView!
    @IBOutlet weak var secondTapView: UIView!
    @IBOutlet weak var thirdTapView: UIView!
    @IBOutlet weak var fourthTapView: UIView!
    
    
    @IBOutlet weak var firstViewSegmentControl: UISegmentedControl!
    @IBOutlet weak var firstViewSlider: UISlider!
    @IBOutlet weak var secondViewSegmentControl: UISegmentedControl!
    @IBOutlet weak var secondViewSlider: UISlider!
    @IBOutlet weak var thirdViewSegmentControl: UISegmentedControl!
    @IBOutlet weak var thirdViewSlider: UISlider!
    @IBOutlet weak var fourthViewSegmentControl: UISegmentedControl!
    @IBOutlet weak var fourthViewSlider: UISlider!
    
    @IBOutlet weak var firstViewTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var firstViewDoubleTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var secondViewTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var secondViewDoubleTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var thirdViewTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var thirdViewDoubleTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var fourthViewTapGestureRecognizer: UITapGestureRecognizer!
    @IBOutlet weak var fourthViewDoubleTapGestureRecognizer: UITapGestureRecognizer!
    
// MARK: 制約のoutlet接続
    // 制約のoutletCollection接続 portrait
    @IBOutlet var PortraitConstranitArray: [NSLayoutConstraint]!
   // 制約のoutletCollection接続 landScape
    @IBOutlet var LandScapeConstraintArray: [NSLayoutConstraint]!
   
    var savedTimeIntervalDictionary: [String: Double] = ["first": 0.4, "second": 0.4, "third": 0.4, "fourth": 0.4]
    var savedlineColorDictionary: [String: Int] = ["first": 0, "second": 0, "third": 0, "fourth": 0]
    
    var firstTimer:Timer?
    var secondTimer:Timer?
    var thirdTimer:Timer?
    var fourthTimer:Timer?
    
    var firstPointListArray = [CGPoint]()
    var secondPointListArray = [CGPoint]()
    var thirdPointListArray = [CGPoint]()
    var fourthPointListArray = [CGPoint]()
    
    var firstViewLineColorInt: Int = 0
    var secondViewLineColorInt: Int = 0
    var thirdViewLineColorInt: Int = 0
    var fourthViewLineColorInt: Int = 0
    
    var firstViewLineColor: UIColor = .red
    var secondViewLineColor: UIColor = .red
    var thirdViewLineColor: UIColor = .red
    var fourthViewLineColor: UIColor = .red
    
    var firstViewtimeInterval: Double = 0.4
    var secondViewtimeInterval: Double = 0.4
    var thirdViewtimeInterval: Double = 0.4
    var fourthViewtimeInterval: Double = 0.4
    
    
    var firstDrawStatus: Bool = false
    var secondDrawStatus: Bool = false
    var thirdDrawStatus: Bool = false
    var fourthDrawStatus: Bool = false
    
    var firstViewTapStatus: Bool = false
    var secondViewTapStatus: Bool = false
    var thirdViewTapStatus: Bool = false
    var fourthViewTapStatus: Bool = false
    
    
   //MARK: ***** ViewDidLoad *****
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let userDefaults = UserDefaults.standard
        // 初期値登録
        userDefaults.register(defaults: savedTimeIntervalDictionary)
        userDefaults.register(defaults: savedlineColorDictionary)
        
        //userDefaults.set(titles, forKey: titleKey)
        userDefaults.synchronize()
        
        //　Settingsを読み込む
        //readSettingsDictionary()
        
        // 通知センターのオブジェクトを作る
        let notification = NotificationCenter.default
        // デバイスの向きが変わった
        notification.addObserver(self,
            selector: #selector(self.changedDeviceOrientation(_:)),
            name: Notification.Name.UIDeviceOrientationDidChange, object: nil)
        
    
        if firstViewLineColorInt ==  0 {
            firstViewSegmentControl.selectedSegmentIndex = 0
            firstViewLineColor = .red
        } else if firstViewLineColorInt ==  1 {
            firstViewSegmentControl.selectedSegmentIndex = 1
            firstViewLineColor = .blue
        } else if firstViewLineColorInt ==  2 {
            firstViewSegmentControl.selectedSegmentIndex = 2
            firstViewLineColor = .green
        } else if firstViewLineColorInt ==  3 {
            firstViewSegmentControl.selectedSegmentIndex = 3
            firstViewLineColor = .yellow
        } else {
            
        }
        
        if secondViewLineColorInt ==  0 {
            secondViewSegmentControl.selectedSegmentIndex = 0
            secondViewLineColor = .red
        } else if secondViewLineColorInt ==  1 {
            secondViewSegmentControl.selectedSegmentIndex = 1
            secondViewLineColor = .blue
        } else if secondViewLineColorInt ==  2 {
            secondViewSegmentControl.selectedSegmentIndex = 2
            secondViewLineColor = .green
        } else if secondViewLineColorInt ==  3 {
            secondViewSegmentControl.selectedSegmentIndex = 3
            secondViewLineColor = .yellow
        } else {
            
        }
        
        if thirdViewLineColorInt ==  0 {
            thirdViewSegmentControl.selectedSegmentIndex = 0
            thirdViewLineColor = .red
        } else if thirdViewLineColorInt ==  1 {
            thirdViewSegmentControl.selectedSegmentIndex = 1
            thirdViewLineColor = .blue
        } else if thirdViewLineColorInt ==  2 {
            thirdViewSegmentControl.selectedSegmentIndex = 2
            thirdViewLineColor = .green
        } else if thirdViewLineColorInt ==  3 {
            thirdViewSegmentControl.selectedSegmentIndex = 3
            thirdViewLineColor = .yellow
        } else {
            
        }
        
        if fourthViewLineColorInt ==  0 {
            fourthViewSegmentControl.selectedSegmentIndex = 0
            fourthViewLineColor = .red
        } else if fourthViewLineColorInt ==  1 {
            fourthViewSegmentControl.selectedSegmentIndex = 1
            fourthViewLineColor = .blue
        } else if fourthViewLineColorInt ==  2 {
            fourthViewSegmentControl.selectedSegmentIndex = 2
            fourthViewLineColor = .green
        } else if fourthViewLineColorInt ==  3 {
            fourthViewSegmentControl.selectedSegmentIndex = 3
            fourthViewLineColor = .yellow
        } else {
            
        }
        
        firstViewSlider.value = Float(firstViewtimeInterval)
        secondViewSlider.value = Float(secondViewtimeInterval)
        thirdViewSlider.value = Float(thirdViewtimeInterval)
        fourthViewSlider.value = Float(fourthViewtimeInterval)
        
        
        // Do any additional setup after loading the view, typically from a nib.
        firstViewTapGestureRecognizer.require(toFail: firstViewDoubleTapGestureRecognizer)
        secondViewTapGestureRecognizer.require(toFail: secondViewDoubleTapGestureRecognizer)
        thirdViewTapGestureRecognizer.require(toFail: thirdViewDoubleTapGestureRecognizer)
        fourthViewTapGestureRecognizer.require(toFail: fourthViewDoubleTapGestureRecognizer)
        
        
//        self.firstViewTapped(firstViewTapGestureRecognizer)
//        self.secondViewTapped(secondViewTapGestureRecognizer)
//        self.thirdViewTapped(thirdViewTapGestureRecognizer)
//        self.fourthViewTapped(fourthViewTapGestureRecognizer)
    }
    
    // orientationを許可
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        // 許可する画面を追加
        let orientation: UIInterfaceOrientationMask = [UIInterfaceOrientationMask.portrait,
                                                       UIInterfaceOrientationMask.portraitUpsideDown,
                                                       UIInterfaceOrientationMask.landscapeLeft,
                                                       UIInterfaceOrientationMask.landscapeRight]
        return orientation
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // changeTimeInterval
    
    @IBAction func firstViewTimeIntervalChanged(_ sender: UISlider) {
        firstViewtimeInterval = Double(sender.value)
        self.firstViewTapped(firstViewTapGestureRecognizer)
        saveSettingsDictionary ()
    }
    @IBAction func secondViewTimeIntervalChanged(_ sender: UISlider) {
        secondViewtimeInterval = Double(sender.value)
        self.secondViewTapped(secondViewTapGestureRecognizer)
        saveSettingsDictionary ()
    }
    @IBAction func thirdViewTimeIntervalChanged(_ sender: UISlider) {
        thirdViewtimeInterval = Double(sender.value)
        self.thirdViewTapped(thirdViewTapGestureRecognizer)
        saveSettingsDictionary ()
    }
    @IBAction func fourthViewTimeIntervalChanged(_ sender: UISlider) {
        fourthViewtimeInterval = Double(sender.value)
        self.fourthViewTapped(fourthViewTapGestureRecognizer)
        saveSettingsDictionary ()
    }
    
    
    
    // changeLineColor
    @IBAction func firstViewLineColorChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : firstViewLineColor = UIColor.red; firstViewLineColorInt = 0
        case 1 : firstViewLineColor = UIColor.blue; firstViewLineColorInt = 1
        case 2 : firstViewLineColor = UIColor.green; firstViewLineColorInt = 2
        case 3 : firstViewLineColor = UIColor.yellow; firstViewLineColorInt = 3
        default: break
        }
        saveSettingsDictionary ()
    }
    @IBAction func secondViewLineColorChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : secondViewLineColor = UIColor.red; secondViewLineColorInt = 0
        case 1 : secondViewLineColor = UIColor.blue; secondViewLineColorInt = 1
        case 2 : secondViewLineColor = UIColor.green; secondViewLineColorInt = 2
        case 3 : secondViewLineColor = UIColor.yellow; secondViewLineColorInt = 3
        default: break
        }
        saveSettingsDictionary ()
    }
    @IBAction func thirdViewLineColorChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : thirdViewLineColor = UIColor.red; thirdViewLineColorInt = 0
        case 1 : thirdViewLineColor = UIColor.blue; thirdViewLineColorInt = 1
        case 2 : thirdViewLineColor = UIColor.green; thirdViewLineColorInt = 2
        case 3 : thirdViewLineColor = UIColor.yellow; thirdViewLineColorInt = 3
        default: break
        }
        saveSettingsDictionary ()
    }
    @IBAction func fourthViewLineColorChanged(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0 : fourthViewLineColor = UIColor.red; fourthViewLineColorInt = 0
        case 1 : fourthViewLineColor = UIColor.blue; fourthViewLineColorInt = 1
        case 2 : fourthViewLineColor = UIColor.green; fourthViewLineColorInt = 2
        case 3 : fourthViewLineColor = UIColor.yellow; fourthViewLineColorInt = 3
        default: break
        }
        saveSettingsDictionary ()
    }
    
    
    
    @IBAction func firstViewTapped(_ sender: UITapGestureRecognizer) {
        if firstViewTapStatus == false {
            firstViewTapStatus = true
            if firstTimer == nil {
                // 0.3s 毎にTemporalEventを呼び出す
                firstTimer = Timer.scheduledTimer(timeInterval: firstViewtimeInterval, target: self, selector: #selector (drawFirstGraph), userInfo: nil,repeats: true)
            }
        } else {
            firstViewTapStatus = false
            //firstPointListArray = []
            if firstTimer != nil {
                firstTimer?.invalidate()
                firstTimer = nil
            }
        }
    }
    
    @IBAction func firstViewDoubleTapped(_ sender: UITapGestureRecognizer) {
        if firstViewSegmentControl.isHidden == true && firstViewSlider.isHidden == true {
            firstViewSegmentControl.isHidden = false
            firstViewSlider.isHidden = false
            firstViewSegmentControl.alpha = 0.0
            firstViewSlider.alpha = 0.0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.firstViewSegmentControl.alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.firstViewSlider.alpha = 1.0}, completion: nil)
            
            //firstViewSegmentControl.isHidden = false
            //firstViewSlider.isHidden = false
        } else {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.firstViewSegmentControl.alpha = 0.0}, completion: {_ in self.firstViewSegmentControl.isHidden = true})
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.firstViewSlider.alpha = 0.0}, completion: {_ in self.firstViewSlider.isHidden = true})
            
            
            //firstViewSegmentControl.isHidden = true
            //firstViewSlider.isHidden = true
        }
    }
    
    @IBAction func firstViewLongTapped(_ sender: UILongPressGestureRecognizer) {
        if(sender.state == UIGestureRecognizerState.began) {
            if firstTimer != nil {
                firstTimer?.invalidate()
                firstTimer = nil
            }
            animation(view:firstGraphView)
        } else if (sender.state == UIGestureRecognizerState.ended) {
            firstViewTapStatus = false
            firstPointListArray = []
            let subviews = firstGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
    }
    
    
    
    @IBAction func secondViewTapped(_ sender: UITapGestureRecognizer) {
        if secondViewTapStatus == false {
            secondViewTapStatus = true
            if secondTimer == nil {
                // 0.3s 毎にTemporalEventを呼び出す
                secondTimer = Timer.scheduledTimer(timeInterval: secondViewtimeInterval, target: self, selector: #selector (drawSecondGraph), userInfo: nil,repeats: true)
            }
        } else {
           
            secondViewTapStatus = false
            //secondPointListArray = []
            if secondTimer != nil {
                secondTimer?.invalidate()
                secondTimer = nil
            }
        }
    }
    
    @IBAction func secondViewDoubleTapped(_ sender: UITapGestureRecognizer) {
        if secondViewSegmentControl.isHidden == true && secondViewSlider.isHidden == true {
            secondViewSegmentControl.isHidden = false
            secondViewSlider.isHidden = false
            secondViewSegmentControl.alpha = 0.0
            secondViewSlider.alpha = 0.0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.secondViewSegmentControl.alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.secondViewSlider.alpha = 1.0}, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.secondViewSegmentControl.alpha = 0.0}, completion: {_ in self.secondViewSegmentControl.isHidden = true})
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.secondViewSlider.alpha = 0.0}, completion: {_ in self.secondViewSlider.isHidden = true})
        }
    }
    
    @IBAction func secondViewLongTapped(_ sender: UILongPressGestureRecognizer) {
        if(sender.state == UIGestureRecognizerState.began) {
            if secondTimer != nil {
                secondTimer?.invalidate()
                secondTimer = nil
            }
            animation(view:secondGraphView)
        } else if (sender.state == UIGestureRecognizerState.ended) {
            secondViewTapStatus = false
            secondPointListArray = []
            let subviews = secondGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
    }
    
    @IBAction func thirdViewTapped(_ sender: UITapGestureRecognizer) {
        if thirdViewTapStatus == false {
            thirdViewTapStatus = true
            if thirdTimer == nil {
                // 0.3s 毎にTemporalEventを呼び出す
                thirdTimer = Timer.scheduledTimer(timeInterval: thirdViewtimeInterval, target: self, selector: #selector (drawThirdGraph), userInfo: nil,repeats: true)
            }
        } else {
            thirdViewTapStatus = false
            //thirdPointListArray = []
            if thirdTimer != nil {
                thirdTimer?.invalidate()
                thirdTimer = nil
            }
        }
    }
    
    @IBAction func thirdViewDoubleTapped(_ sender: UITapGestureRecognizer) {
        if thirdViewSegmentControl.isHidden == true && thirdViewSlider.isHidden == true {
            thirdViewSegmentControl.isHidden = false
            thirdViewSlider.isHidden = false
            thirdViewSegmentControl.alpha = 0.0
            thirdViewSlider.alpha = 0.0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.thirdViewSegmentControl.alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.thirdViewSlider.alpha = 1.0}, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.thirdViewSegmentControl.alpha = 0.0}, completion: {_ in self.thirdViewSegmentControl.isHidden = true})
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.thirdViewSlider.alpha = 0.0}, completion: {_ in self.thirdViewSlider.isHidden = true})
        }
    }
    
    @IBAction func thirsViewLongTapped(_ sender: UILongPressGestureRecognizer) {
        if(sender.state == UIGestureRecognizerState.began) {
            if thirdTimer != nil {
                thirdTimer?.invalidate()
                thirdTimer = nil
            }
            animation(view:thirdGraphView)
        } else if (sender.state == UIGestureRecognizerState.ended) {
            thirdViewTapStatus = false
            thirdPointListArray = []
            let subviews = thirdGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
    }
    
    @IBAction func fourthViewTapped(_ sender: UITapGestureRecognizer) {
        if fourthViewTapStatus == false {
            fourthViewTapStatus = true
            if fourthTimer == nil {
                // 0.3s 毎にTemporalEventを呼び出す
                fourthTimer = Timer.scheduledTimer(timeInterval: fourthViewtimeInterval, target: self, selector: #selector (drawFourthGraph), userInfo: nil,repeats: true)
            }
        } else {
            fourthViewTapStatus = false
            //fourthPointListArray = []
            if fourthTimer != nil {
                fourthTimer?.invalidate()
                fourthTimer = nil
            }
        }
    }
    
    @IBAction func fourthViewDoubleTapped(_ sender: UITapGestureRecognizer) {
        if fourthViewSegmentControl.isHidden == true && fourthViewSlider.isHidden == true {
            fourthViewSegmentControl.isHidden = false
            fourthViewSlider.isHidden = false
            fourthViewSegmentControl.alpha = 0.0
            fourthViewSlider.alpha = 0.0
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.fourthViewSegmentControl.alpha = 1.0}, completion: nil)
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.fourthViewSlider.alpha = 1.0}, completion: nil)
        } else {
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.fourthViewSegmentControl.alpha = 0.0}, completion: {_ in self.fourthViewSegmentControl.isHidden = true})
            UIView.animate(withDuration: 0.3, delay: 0.0, options: [.curveEaseIn], animations: {self.fourthViewSlider.alpha = 0.0}, completion: {_ in self.fourthViewSlider.isHidden = true})
        }
    }
    
    @IBAction func fourthViewLongTapped(_ sender: UILongPressGestureRecognizer) {
        if(sender.state == UIGestureRecognizerState.began) {
            if fourthTimer != nil {
                fourthTimer?.invalidate()
                fourthTimer = nil
            }
            animation(view:fourthGraphView)
        } else if (sender.state == UIGestureRecognizerState.ended) {
            fourthViewTapStatus = false
            fourthPointListArray = []
            let subviews = fourthGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        }
    }
    
   
    
    
    // firstGraph
    @objc func drawFirstGraph(){
        let device = UIDevice.current
        // デバイスの向きに応じて配列作成メソッドを変更する
        switch device.orientation {
        case .portrait:
            appCGPointToFirstArrayPR(view: firstGraphView)
        case .portraitUpsideDown:
            appCGPointToFirstArrayPR(view: firstGraphView)
        case .landscapeRight:
            appCGPointToFirstArrayLS(view: firstGraphView)
        case .landscapeLeft:
            appCGPointToFirstArrayLS(view: firstGraphView)
        default: break
        }
        
        let drawLineClass = DrawLineGraph()
        let graph = drawLineClass.drawLine(view: firstGraphView, list: firstPointListArray, color: firstViewLineColor)
        
        if firstDrawStatus == true {
            let subviews = firstGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        } else {
            firstDrawStatus = true
        }
        firstGraphView.addSubview(graph)
    }
    
    func appCGPointToFirstArrayPR(view: UIView){
        // 点の個数
        let pointCount = 100
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = firstPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 50 )
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if firstPointListArray.count < pointCount {
            firstPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...firstPointListArray.count - 1 {
                let prePoint = firstPointListArray[i - 1]
                var nextPoint = firstPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            firstPointListArray = []
            firstPointListArray = tempArray
            firstPointListArray.append(point)
        }
    }
    
    func appCGPointToFirstArrayLS(view: UIView){
        // 点の個数
        let pointCount = 300
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = firstPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 25)
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if firstPointListArray.count < pointCount {
            firstPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...firstPointListArray.count - 1 {
                let prePoint = firstPointListArray[i - 1]
                var nextPoint = firstPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            firstPointListArray = []
            firstPointListArray = tempArray
            firstPointListArray.append(point)
        }
    }
    
    
    
    // secondGraph
    @objc func drawSecondGraph(){
        let device = UIDevice.current
        // デバイスの向きに応じて配列作成メソッドを変更する
        switch device.orientation {
        case .portrait:
            appCGPointToSecondArrayPR(view: secondGraphView)
        case .portraitUpsideDown:
            appCGPointToSecondArrayPR(view: secondGraphView)
        case .landscapeRight:
            appCGPointToSecondArrayLS(view: secondGraphView)
        case .landscapeLeft:
            appCGPointToSecondArrayLS(view: secondGraphView)
        default: break
        }
        
        let drawLineClass = DrawLineGraph()
        let graph = drawLineClass.drawLine(view: secondGraphView, list: secondPointListArray, color: secondViewLineColor)
        
        if secondDrawStatus == true {
            let subviews = secondGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        } else {
            secondDrawStatus = true
        }
        secondGraphView.addSubview(graph)
    }
 
    func appCGPointToSecondArrayPR(view: UIView){
        // 点の個数
        let pointCount = 100
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        print("secondPRView.frame.width:",view.frame.width)
        print("secondPRview:",view)
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = secondPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 50 )
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if secondPointListArray.count < pointCount {
            secondPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...secondPointListArray.count - 1 {
                let prePoint = secondPointListArray[i - 1]
                var nextPoint = secondPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            secondPointListArray = []
            secondPointListArray = tempArray
            secondPointListArray.append(point)
        }
    }
    
    func appCGPointToSecondArrayLS(view: UIView){
        // 点の個数
        let pointCount = 300
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        print("secondLSView.frame.width:",view.frame.width)
        print("secondLSview:",view)
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = secondPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 25 )
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if secondPointListArray.count < pointCount {
            secondPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...secondPointListArray.count - 1 {
                let prePoint = secondPointListArray[i - 1]
                var nextPoint = secondPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            secondPointListArray = []
            secondPointListArray = tempArray
            secondPointListArray.append(point)
        }
    }
    
    
    // thirdGraph
    @objc func drawThirdGraph(){
        let device = UIDevice.current
        // デバイスの向きに応じて配列作成メソッドを変更する
        switch device.orientation {
        case .portrait:
            appCGPointToThirdArrayPR(view: thirdGraphView)
        case .portraitUpsideDown:
            appCGPointToThirdArrayPR(view: thirdGraphView)
        case .landscapeRight:
            appCGPointToThirdArrayLS(view: thirdGraphView)
        case .landscapeLeft:
            appCGPointToThirdArrayLS(view: thirdGraphView)
        default: break
        }
        
        let drawLineClass = DrawLineGraph()
        let graph = drawLineClass.drawLine(view: thirdGraphView, list: thirdPointListArray, color: thirdViewLineColor)
        
        if thirdDrawStatus == true {
            let subviews = thirdGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        } else {
            thirdDrawStatus = true
        }
        thirdGraphView.addSubview(graph)
    }
    
    func appCGPointToThirdArrayPR(view: UIView){
        // 点の個数
        let pointCount = 100
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        print("thridPRView.frame.width:",view.frame.width)
        print("thridPRView:",view)
        
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = thirdPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 50 )
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if thirdPointListArray.count < pointCount {
            thirdPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...thirdPointListArray.count - 1 {
                let prePoint = thirdPointListArray[i - 1]
                var nextPoint = thirdPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            thirdPointListArray = []
            thirdPointListArray = tempArray
            thirdPointListArray.append(point)
        }
    }
    
    func appCGPointToThirdArrayLS(view: UIView){
        // 点の個数
        let pointCount = 300
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        print("thridLSView.frame.width:",view.frame.width)
        print("thridLSView:",view)
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = thirdPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 25 )
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if thirdPointListArray.count < pointCount {
            thirdPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...thirdPointListArray.count - 1 {
                let prePoint = thirdPointListArray[i - 1]
                var nextPoint = thirdPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            thirdPointListArray = []
            thirdPointListArray = tempArray
            thirdPointListArray.append(point)
        }
    }
    
    // fourthGraph
    @objc func drawFourthGraph(){
        let device = UIDevice.current
        // デバイスの向きに応じて配列作成メソッドを変更する
        switch device.orientation {
        case .portrait:
            appCGPointToFourthArrayPR(view: fourthGraphView)
        case .portraitUpsideDown:
            appCGPointToFourthArrayPR(view: fourthGraphView)
        case .landscapeRight:
            appCGPointToFourthArrayLS(view: fourthGraphView)
        case .landscapeLeft:
            appCGPointToFourthArrayLS(view: fourthGraphView)
        default: break
        }
        
        let drawLineClass = DrawLineGraph()
        let graph = drawLineClass.drawLine(view: fourthGraphView, list: fourthPointListArray, color: fourthViewLineColor)
        
        if fourthDrawStatus == true {
            let subviews = fourthGraphView.subviews
            for subview in subviews {
                subview.removeFromSuperview()
            }
        } else {
            fourthDrawStatus = true
        }
        fourthGraphView.addSubview(graph)
    }
    
    func appCGPointToFourthArrayPR(view: UIView){
        // 点の個数
        let pointCount = 100
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = fourthPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 50 )
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if fourthPointListArray.count < pointCount {
            fourthPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...fourthPointListArray.count - 1 {
                let prePoint = fourthPointListArray[i - 1]
                var nextPoint = fourthPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            fourthPointListArray = []
            fourthPointListArray = tempArray
            fourthPointListArray.append(point)
        }
    }
    
    func appCGPointToFourthArrayLS(view: UIView){
        // 点の個数
        let pointCount = 300
        // xの間隔
        let dx = Double(view.frame.width) / Double(pointCount)
        // yの間隔
        let height = UInt32(view.frame.height) / 2
        // 点(CGPoint)を作る
        let n = fourthPointListArray.count + 1
        let px = CGFloat(dx * Double(n))
        let py = CGFloat(arc4random_uniform(height) + 25 )
        let point = CGPoint(x: px, y: py)
        // 点を配列に追加する
        if fourthPointListArray.count < pointCount {
            fourthPointListArray.append(point)
        } else {
            var tempArray = [CGPoint]()
            for i in 1...fourthPointListArray.count - 1 {
                let prePoint = fourthPointListArray[i - 1]
                var nextPoint = fourthPointListArray[i]
                nextPoint.x = prePoint.x
                tempArray.append(nextPoint)
            }
            fourthPointListArray = []
            fourthPointListArray = tempArray
            fourthPointListArray.append(point)
        }
    }
    
    // ラベルのアニメーション処理
    func animation (view:UIView) {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 0.8
        animation.fromValue = 1.05
        animation.toValue = 1.0
        animation.mass = 1.0
        animation.initialVelocity = 10.0
        animation.damping = 4.0
        animation.stiffness = 50.0
        view.layer.add(animation, forKey: nil)
    }
     
    
}

