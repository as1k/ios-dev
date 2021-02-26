//
//  CustomView.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/20/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class CustomView: UIView {
    
    override func draw(_ rect: CGRect) {
        // Drawing code
        let radius = min(bounds.height/2, bounds.width/2) * 0.9
        let path = UIBezierPath(arcCenter: center, radius: radius, startAngle: 0, endAngle: 2*Double.pi.cg, clockwise: false)
        UIColor.black.set()
        path.fill()
    }
    
    
}

extension Double {
    var cg: CGFloat {
        return CGFloat(self)
    }
    
}
