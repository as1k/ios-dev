//
//  Circle.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/26/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class Circle: Figure{
    
    private var radius: CGFloat = 0.0
    private var center: CGPoint
    
    init(withSome color: UIColor, and strokeWidth: CGFloat, isFilled: Bool, with radius: CGFloat, and circleCenter: CGPoint) {
        self.radius = radius
        self.center = circleCenter
        super.init(withSome: color, and: strokeWidth, isFilled: isFilled)
    }
    
    override func draw(){
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2*Double.pi.cg, clockwise: true)
        color.set()
        path.lineWidth = 3
        (isFilled) ? (path.fill()) :(path.stroke())
    }
}

extension Double{
    var cg:CGFloat{
        return CGFloat(self)
    }
}
