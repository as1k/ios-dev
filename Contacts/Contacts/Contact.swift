//
//  Contact.swift
//  Contacts
//
//  Created by Асыланбек Нурмухамбет on 2/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation
import UIKit

class Contact{
    var name_surname: String?
    var phone: String?
    var image: UIImage?
    
    init(_ name_surname: String, _ phone: String, _ image: UIImage) {
        self.name_surname = name_surname
        self.phone = phone
        self.image = image
    }
}
