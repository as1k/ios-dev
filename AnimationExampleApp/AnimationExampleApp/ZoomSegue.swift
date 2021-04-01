//
//  ZoomSegue.swift
//  AnimationExampleApp
//
//  Created by Асыланбек Нурмухамбет on 4/1/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class ZoomSegue: UIStoryboardSegue {
    
    override func perform() {
        let destinationView = self.destination.view
        let sourceView = self.source.view
        animateZoomSegue(source: sourceView, destionation: destinationView, duration: 0.5)
    }
    
    func animateZoomSegue(source: UIView?, destionation: UIView?, duration: Double) {
        UIView.animate(withDuration: duration, animations: {
            source?.alpha = 0
        }) { (Bool) in
            self.source.present(self.destination, animated: false) {
                destionation?.transform = CGAffineTransform(scaleX: 0.00001, y: 0.00001)
                UIView.animate(withDuration: 1, animations: {
                    destionation?.transform = CGAffineTransform.identity
                })
            }
        }
    }
}
