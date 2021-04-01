//
//  PhonesViewController.swift
//  AnimationExampleApp
//
//  Created by Асыланбек Нурмухамбет on 4/1/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

var phones: [Phone] = [Phone.init("iPhone", "1200$", "Snapdragon 835", "10MPX"),
                       Phone.init("Samsung", "500$", "A10 Fusion ", "10MPX"),
                       Phone.init("Huawei", "400$", "Snapdragon 835", "10MPX"),
                       Phone.init("Xiaomi", "500$", "Snapdragon 835", "10MPX"),
                       Phone.init("Honor", "300$", "Snapdragon 835", "10MPX"),
                       Phone.init("Motorolla", "50$", "Snapdragon 835", "10MPX"),
                       Phone.init("Nokia", "100$", "Snapdragon 835", "10MPX")]

class PhonesViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "PhoneCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "myCell")
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return phones.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! PhoneCell
        
        cell.normalTitle?.text = phones[indexPath.row].name
        cell.normalSubtitle?.text = phones[indexPath.row].price
        cell.secondTitle?.text = phones[indexPath.row].glassType
        cell.secondSubtitle?.text = phones[indexPath.row].chipType
        cell.frame.origin.x = -cell.frame.width
        cell.accessoryType = .detailButton
        
        let delay = Double(indexPath.row) * 0.2
        UIView.animate(withDuration: 0.7, delay: TimeInterval(delay), usingSpringWithDamping: 1, initialSpringVelocity: 0, options: .allowUserInteraction, animations: {
            cell.frame.origin.x = 0
        }, completion: nil)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, accessoryButtonTappedForRowWith indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath) as! PhoneCell
        cell.accessoryType = .none
        cell.layer.backgroundColor = cell.flipView.layer.backgroundColor
        UIView.transition(with: cell.contentView,
                          duration: 0.6,
                          options: .transitionFlipFromTop,
                          animations:  {
                            cell.contentView.insertSubview(
                                cell.flipView,
                                aboveSubview:
                                cell.normalView
                            )
        })
    }
}
