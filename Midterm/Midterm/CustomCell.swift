//
//  CustomCell.swift
//  Midterm
//
//  Created by Асыланбек Нурмухамбет on 3/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var timeUILabel: UILabel!
    @IBOutlet weak var notesUILabel: UILabel!
    @IBOutlet weak var switchButton: UISwitch!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
