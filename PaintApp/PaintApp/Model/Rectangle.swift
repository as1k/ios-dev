//
//  Rectangle.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/26/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit
class Rectangle: Figure{
    
    private var p1: CGPoint
    private var p2: CGPoint
    
    init( withSome color:UIColor, and strokeWidth: CGFloat, isFilled: Bool, with p1:CGPoint, and p2: CGPoint) {
        self.p1 = p1
        self.p2 = p2
        super.init(withSome: color, and: strokeWidth, isFilled: isFilled)
    }

    override func draw(){
        let rectangle = CGRect(origin: p1, size: CGSize(width: abs(p2.x-p1.x), height: p2.y - p1.y))
        let path = UIBezierPath(rect: rectangle)
        color.set()
        path.lineWidth = 3
        (isFilled) ? (path.fill()) : (path.stroke())
    }
}
