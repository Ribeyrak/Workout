//
//  ProgressView.swift
//  WorkoutApp
//
//  Created by Evhen Lukhtan on 07.03.2023.
//

import UIKit

extension TimerView {
    final class ProgressView: UIView {
        func drawProgress(with percent: CGFloat) {
            
            let circleFrame = UIScreen.main.bounds.width - (15 + 40) * 2
            let radius = circleFrame / 2
            let center = CGPoint(x: radius, y: radius)
            let startAngle = -CGFloat.pi * 7 / 6
            let endAngle = CGFloat.pi * 1 / 6
            
            let circlePath = UIBezierPath(arcCenter: center,
                                          radius: radius,
                                          startAngle: startAngle,
                                          endAngle: endAngle,
                                          clockwise: true)
            
            let cicrleLayer = CAShapeLayer()
            cicrleLayer.path = circlePath.cgPath
            cicrleLayer.strokeColor = R.Colors.active.cgColor
            cicrleLayer.lineWidth = 20
            cicrleLayer.strokeEnd = percent
            cicrleLayer.fillColor = UIColor.clear.cgColor
            cicrleLayer.lineCap = .round

            layer.addSublayer(cicrleLayer)
        }
    }
}
