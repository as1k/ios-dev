//
//  PhoneCell.swift
//  AnimationExampleApp
//
//  Created by Асыланбек Нурмухамбет on 4/1/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class PhoneCell: UITableViewCell {
    
    @IBOutlet weak var normalView: UIView!
    @IBOutlet weak var normalTitle: UILabel!
    @IBOutlet weak var normalSubtitle: UILabel!
    
    @IBOutlet weak var flipView: UIView!
    @IBOutlet weak var secondTitle: UILabel!
    @IBOutlet weak var secondSubtitle: UILabel!

    @IBOutlet weak var hideButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }
    
    @IBAction func hide(_ sender: UIButton) {
        UIView.animate(withDuration: 0.7, delay: 0, options: .curveEaseOut, animations: {
            self.flipView.transform = CGAffineTransform(translationX: self.flipView.bounds.width, y: 0)
            self.flipView.alpha = 0
        }, completion: {_ in
            self.contentView.insertSubview(self.normalView, aboveSubview: self.flipView)
            self.flipView.transform = CGAffineTransform(translationX: 0, y: 0)
            self.flipView.alpha = 1
            self.layer.backgroundColor = self.normalView.layer.backgroundColor
            self.accessoryType = .detailButton
        })
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
