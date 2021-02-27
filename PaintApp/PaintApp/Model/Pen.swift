//
//  Pen.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/26/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class Pen: Figure{
    private var points: [CGPoint]?
    
    init( withSome color:UIColor, and strokeWidth: CGFloat, isFilled: Bool, with p1:[CGPoint]?) {
        self.points = p1
        super.init(withSome: color, and: strokeWidth, isFilled: isFilled)
    }
    
    override func draw(){
        let path = UIBezierPath()
        for (i,p) in (points?.enumerated())!{
            if i == 0 {
                path.move(to: p)
            } else {
                path.addLine(to: p)
            }
        }
        color.set()
        path.lineWidth = 3
        path.stroke()
    }
}
