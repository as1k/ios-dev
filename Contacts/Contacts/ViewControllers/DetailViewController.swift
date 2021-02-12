//
//  DetailViewController.swift
//  Contacts
//
//  Created by Асыланбек Нурмухамбет on 2/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var imageLabel: UIImageView!
    @IBOutlet weak var phoneLabel: UILabel!
    @IBOutlet weak var nameSurnameLabel: UILabel!
    var name_surname: String?
    var phone: String?
    var image: UIImage?
    var currentIndex: Int?
    var actionsProtocol: ActionsProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameSurnameLabel.text = name_surname
        phoneLabel.text = phone
        imageLabel.image = image
        // Do any additional setup after loading the view.
    }
    
    @IBAction func deletePressed(_ sender: UIButton) {
        actionsProtocol?.deleteContact(nameSurname: name_surname!, phoneNumber: phone!, index: currentIndex!)
        navigationController?.popViewController(animated: true)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
