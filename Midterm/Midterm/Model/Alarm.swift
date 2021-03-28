//
//  Alarm.swift
//  Midterm
//
//  Created by Асыланбек Нурмухамбет on 3/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation

class Alarm {
    var time: String?
    var notes: String?
    var isSwitchOn: Bool = true
    
    init(_ time: String, _ notes: String, _ isSwitchOn: Bool) {
        self.time = time
        self.notes = notes
        self.isSwitchOn = isSwitchOn
    }
}
