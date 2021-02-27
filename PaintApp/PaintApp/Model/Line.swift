//
//  File.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/26/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class Line: Figure{
    
    private var p1: CGPoint
    private var p2: CGPoint
    
    init(withSome color: UIColor, and strokeWidth: CGFloat, isFilled: Bool, with p1:CGPoint, and p2: CGPoint) {
        self.p1 = p1
        self.p2 = p2
        super.init(withSome: color, and: strokeWidth, isFilled: isFilled)
    }
    
    override func draw(){
        let path = UIBezierPath()
        path.move(to: p1)
        path.addLine(to: p2)
        path.close()
        color.set()
        path.lineWidth = 3
        path.stroke()
    }
}
