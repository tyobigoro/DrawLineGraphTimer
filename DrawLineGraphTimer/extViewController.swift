//
//  extViewController.swift
//  DrawLineGraphTimer
//
//  Created by Tyobigoro on 2018/05/28.
//  Copyright © 2018年 Tyobigoro. All rights reserved.
//
import UIKit

extension ViewController {
    
    // Settingsを出力する
    func saveSettingsDictionary () {
        // 小数点処理の保存データを処理する
        savedTimeIntervalDictionary["first"] = firstViewtimeInterval
        savedTimeIntervalDictionary["second"] = secondViewtimeInterval
        savedTimeIntervalDictionary["third"] = thirdViewtimeInterval
        savedTimeIntervalDictionary["fourth"] = fourthViewtimeInterval
        
        UserDefaults.standard.set(savedTimeIntervalDictionary, forKey:"savedTimeIntervalDictionary")
        
        savedlineColorDictionary["first"] = firstViewLineColorInt
        savedlineColorDictionary["second"] = secondViewLineColorInt
        savedlineColorDictionary["third"] = thirdViewLineColorInt
        savedlineColorDictionary["fourth"] = fourthViewLineColorInt
        UserDefaults.standard.set(savedlineColorDictionary, forKey:"savedlineColorDictionary")
        
        UserDefaults.standard.synchronize()
    }
    
    // Settingsを読み込む
    func readSettingsDictionary() {
        savedTimeIntervalDictionary = UserDefaults.standard.dictionary(forKey: "savedTimeIntervalDictionary") as! [String : Double]
        // 小数点処理の保存データを処理する
        firstViewtimeInterval = savedTimeIntervalDictionary["first"]!
        secondViewtimeInterval = savedTimeIntervalDictionary["second"]!
        thirdViewtimeInterval = savedTimeIntervalDictionary["third"]!
        fourthViewtimeInterval = savedTimeIntervalDictionary["fourth"]!
       
        
        savedlineColorDictionary = UserDefaults.standard.dictionary(forKey: "savedlineColorDictionary") as! [String : Int]
        firstViewLineColorInt = savedlineColorDictionary["first"]!
        secondViewLineColorInt = savedlineColorDictionary["second"]!
        thirdViewLineColorInt = savedlineColorDictionary["third"]!
        fourthViewLineColorInt = savedlineColorDictionary["fourth"]!
        
    }
    
//    //　アニメーション
//    UIView.transition(with: blueView, duration: 1.0, options: [.transitionCrossDissolve, .autoreverse], animations: {
//    self.blueView.isHidden = true
//    }) { _ in
//    self.blueView.isHidden = false
//    }
    
}
