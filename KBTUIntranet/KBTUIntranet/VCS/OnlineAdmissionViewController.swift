//
//  OnlineAdmissionViewController.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/20/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class OnlineAdmissionViewController: UIViewController {

    @IBOutlet weak var onlineEntryBtn: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        onlineEntryBtn.layer.backgroundColor = UIColor(red: 85, green: 120, blue: 245).cgColor
        onlineEntryBtn.layer.cornerRadius = onlineEntryBtn.frame.height/2
        onlineEntryBtn.layer.shadowPath = UIBezierPath(roundedRect: onlineEntryBtn.bounds, cornerRadius: 20).cgPath
        onlineEntryBtn.titleLabel!.numberOfLines = 0; // Dynamic number of lines
        onlineEntryBtn.titleLabel!.lineBreakMode = NSLineBreakMode.byWordWrapping;
        onlineEntryBtn.titleLabel!.textAlignment = NSTextAlignment.center
        onlineEntryBtn.contentEdgeInsets  = UIEdgeInsets(top: 10,left: 10,bottom: 10,right: 10)
        onlineEntryBtn.layer.shadowRadius = 10
        onlineEntryBtn.layer.shadowOffset = CGSize(width: 0, height: 0)
        onlineEntryBtn.layer.shadowOpacity = 0.5
        onlineEntryBtn.layer.shadowColor = UIColor(red: 85, green: 200, blue: 245).cgColor
        // Do any additional setup after loading the view.
    }
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
        )
    }
}
