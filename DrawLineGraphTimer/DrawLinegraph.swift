//
//  DrawLinegraph.swift
//  C17 TeseDrawPath
//
//  Created by Tyobigoro on 2018/05/26.
//  Copyright © 2018年 Tyobigoro. All rights reserved.
//

import UIKit

class DrawLineGraph {

// 折れ線グラフを作る
    func drawLine(view: UIView, list: [CGPoint], color: UIColor) -> UIView {
    
//    // 点の座標を入れる配列を作る
//    var pointList = Array<CGPoint>()
//    // 点の個数
//    let pointCount = 150
//    // xの間隔
//    let dx = Double(view.frame.width) / Double(pointCount)
//        print("view.frame.width:",view.frame.width)
//    // yの間隔
//    let height = UInt32(view.frame.height) / 2
//    // 点の配列を作る
//    for n in 1 ... pointCount {
//        let px = CGFloat(dx * Double(n))
//        let py = CGFloat(arc4random_uniform(height) + 50 )
//        let point = CGPoint(x: px, y: py)
//        pointList.append(point)
//    }
    
    //print("pointList:",pointList)
        
    var pointList = list

    // イメージ処理を開始
    let size = view.bounds.size
    UIGraphicsBeginImageContextWithOptions(size, false, 1.0)
    
    // パスの初期化
    let drawPath = UIBezierPath()
    
    // 始点に移動する
    drawPath.move(to: pointList[0])
   
    // 配列から始点の値を取り除く
    pointList.removeFirst()
    
    // 配列から点を取り出して連結していく
    for pt in pointList {
        drawPath.addLine(to: pt)
    }
    
    // 線の色
    color.setStroke()
    // 線幅
    drawPath.lineWidth = 1.0
    // 線のつなぎ目の形状
    drawPath.lineJoinStyle = .round
    // 点線にする
    drawPath.setLineDash([0.5, 0.5], count: 2, phase: 0.0)
    // 線を描く
    drawPath.stroke()
    
    // イメージコンテキストからUIImageを作る
    let image = UIGraphicsGetImageFromCurrentImageContext()
    // イメージ処理の終了
    UIGraphicsEndImageContext()
    
    let lineGraph = UIImageView(image: image)
    
    return lineGraph
}

}



