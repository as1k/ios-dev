//
//  Phone.swift
//  AnimationExampleApp
//
//  Created by Асыланбек Нурмухамбет on 4/1/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation

class Phone  {
    var name: String?
    var price: String?
    var glassType: String?
    var chipType: String?
    
    init(_ name: String, _ price: String, _ glassType: String, _ chipType: String) {
        self.name = name
        self.price = price
        self.glassType = glassType
        self.chipType = chipType
    }
}
