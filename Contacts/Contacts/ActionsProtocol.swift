//
//  ActionsProtocol.swift
//  Contacts
//
//  Created by Асыланбек Нурмухамбет on 2/12/21.
//  Copyright © 2021 kbtu.edu.as1k.kz. All rights reserved.
//

import Foundation

protocol ActionsProtocol {
    
    func addContact(nameSurname:String, phoneNumber: String, gender: String)
    func deleteContact(nameSurname: String, phoneNumber: String, index: Int)
}
