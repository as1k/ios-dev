//
//  Figure.swift
//  PaintApp
//
//  Created by Асыланбек Нурмухамбет on 2/21/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class Figure {
    
    var color: UIColor
    var strokeWidth: CGFloat = 0.0
    var isFilled:Bool
    
    init(withSome color:UIColor, and strokeWidth: CGFloat, isFilled: Bool){
        self.color = color
        self.strokeWidth = strokeWidth
        self.isFilled = isFilled
    }
    
    func draw(){}
}
