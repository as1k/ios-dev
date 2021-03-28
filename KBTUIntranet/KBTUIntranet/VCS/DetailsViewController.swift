//
//  DetailsViewController.swift
//  KBTUIntranet
//
//  Created by Асыланбек Нурмухамбет on 3/13/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class DetailsViewController: UIViewController {

    var newsItemIndex: Int?
    var incrViewCountDelegate: IncrViewDelegate?
    var newsItem: NewsItem?
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        imageView.image = newsItem?.image
        descriptionLabel.text = newsItem?.description
        descriptionLabel.sizeToFit()
        incrViewCountDelegate?.incrViewCountByDelegate(index: newsItemIndex!)
    }
}
