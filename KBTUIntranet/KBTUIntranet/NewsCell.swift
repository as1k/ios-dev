//
//  NewsCell.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/13/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class NewsCell: UITableViewCell {

//    @IBOutlet weak var mainImageView: UIImageView!
//    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var mainImageView: UIImageView!
    @IBOutlet weak var viewCountLabel: UILabel!
    @IBOutlet weak var bookmarkCountLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var bookmarkButton: UIButton!
    var actionBlock: (() -> Void)? = nil
    
    @IBAction func bookmarkClicked(_ sender: UIButton) {
        actionBlock?()
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
