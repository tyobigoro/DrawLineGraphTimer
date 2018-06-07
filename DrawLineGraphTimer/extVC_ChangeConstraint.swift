//
//  extVC_ChangeConstraint.swift
//  DrawLineGraphTimer
//
//  Created by Tyobigoro on 2018/05/29.
//  Copyright © 2018年 Tyobigoro. All rights reserved.
//

import UIKit

extension ViewController {

    @objc func changedDeviceOrientation(_ notification: Notification) {
        // デバイスを取得する
        let device = UIDevice.current
        // デバイスの向きを調べる
        switch device.orientation {
        case .portrait:
            PortraitConstranitArray.forEach { Constraint in Constraint.isActive = true }
            LandScapeConstraintArray.forEach { Constraint in Constraint.isActive = false }
        case .portraitUpsideDown:
            PortraitConstranitArray.forEach { Constraint in Constraint.isActive = true }
            LandScapeConstraintArray.forEach { Constraint in Constraint.isActive = false }
        case .landscapeRight:
            PortraitConstranitArray.forEach { Constraint in Constraint.isActive = false }
            LandScapeConstraintArray.forEach { Constraint in Constraint.isActive = true }
        case .landscapeLeft:
            PortraitConstranitArray.forEach { Constraint in Constraint.isActive = false }
            LandScapeConstraintArray.forEach { Constraint in Constraint.isActive = true }
        default: break
        }
    }
}
